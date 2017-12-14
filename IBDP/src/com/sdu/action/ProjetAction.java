package com.sdu.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.struts2.interceptor.SessionAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sdu.ToolsUse.ElementsTasks;
import com.sdu.ToolsUse.HDFSTools;
import com.sdu.biz.impl.DataFileBizImpl;
import com.sdu.biz.impl.ModelBizImpl;
import com.sdu.biz.impl.ProjectBizImpl;
import com.sdu.dao.impl.ProjectDaoImpl;
import com.sdu.entity.Admin;
import com.sdu.entity.DataFile;
import com.sdu.entity.Model;
import com.sdu.entity.Project;


public class ProjetAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	
	private Map<String,Object> map;
	private Project project;
	
	private ProjectBizImpl projectBiz;
	private ModelBizImpl modelBizImpl;
	private DataFileBizImpl dataFileBiz;
	
	//	private ModelBizImpl modelbiz; //获取model相关信息
	private Admin user;//系统用户
	private int projectid;//项目保存成功后，获取projectid，用于最终保存在中间文件和结果文件
	private JSONObject obj; 
	private String projectJSONStr;
	private int modelid;
	private String actionName;
	private int fileId;
    Map<String, Object> session;
    
   //由前台传递过来的的
    private int offset;
    private int pageSize;
    private int id;
    private String ids;
	//=================================================
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	public Map<String, Object> getMap() {
		return map;
	}
	

	public int getFileId() {
		return fileId;
	}


	public String getActionName() {
		return actionName;
	}


	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public void setProjectBiz(ProjectBizImpl projectBiz) {
		this.projectBiz = projectBiz;
	}

	public String getProjectJSONStr() {
		return projectJSONStr;
	}

	public void setProjectJSONStr(String projectJSONStr) {
		this.projectJSONStr = projectJSONStr;
	}

	public int getModelid() {
		return modelid;
	}

	public void setModelid(int modelid) {
		this.modelid = modelid;
	}

	public ModelBizImpl getModelBizImpl() {
		return modelBizImpl;
	}
	public void setModelBizImpl(ModelBizImpl modelBizImpl) {
		this.modelBizImpl = modelBizImpl;
	}
	public DataFileBizImpl getDataFileBiz() {
		return dataFileBiz;
	}
	public void setDataFileBiz(DataFileBizImpl dataFileBiz) {
		this.dataFileBiz = dataFileBiz;
	}
	
	
	public void setId(int id) {
		this.id = id;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	//--------------------------------------------------------------
	public String showAllProjects(){
		int adminId = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		List<Object> list = projectBiz.getProjectsByAdminId(adminId, offset, pageSize);
		int count = projectBiz.getProjectCountByAdminId(adminId);
		JSONArray array = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject obj = new JSONObject();
			Object[] object = (Object[])list.get(i);
			obj.put("id",object[0]);
			obj.put("name", object[1]);
			obj.put("detail",object[2]);
			obj.put("createtime",object[3]);
	//		System.out.println("admin:"+list.get(i).getP_admin().getName());
			obj.put("creator",object[4]);
			array.put(obj);
		}
		JSONObject json = new JSONObject();
		json.put("total",count);
		json.put("rows", array);
		map = new HashMap<String,Object>();
		map.put("dataJson",json.toString() );
		return "showSuccess";
	}
	public String addProject(){
		System.out.println("projectJSON:  "+projectJSONStr);
		user=(Admin) ActionContext.getContext().getSession().get("user");
		obj = new JSONObject(projectJSONStr);
		project = new Project();
		project.setP_name(obj.getString("name"));
		project.setP_describe(obj.getString("describe"));
		project.setP_admin(user);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		project.setP_createTime(sdf.format(date));
		fileId = obj.getInt("datafileid");
		//System.out.println(obj.getInt("modelid"));
	    projectid=projectBiz.saveProject(project,obj.getInt("modelid"),obj.getInt("datafileid"));
		//多线程运行
       	ThreadPoolExecutor poolExecutor=new ThreadPoolExecutor(3, 4, 1, TimeUnit.MINUTES, new LinkedBlockingDeque());
       	poolExecutor.submit(new Runnable() {
			
			@Override
			public void run() {
				
				try {
					//上传数据文件到hdfs上
					 DataFile sourceFile=dataFileBiz.getById(fileId);
					System.out.println(sourceFile.getD_localpath());
					HDFSTools.LoadSingleFileToHDFS(sourceFile);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}); 
       	try {
				Future future=poolExecutor.submit(new Callable<String>() {
					public String call() throws Exception
					{
						//通过modelid 得到algorithmString， 然后把它解析成JSON ARRAY，
						//取出第一个algorithm的actionname， 将它转发给对应antion去执行分析任务，转发时传递3个参数，第一个datafilepath，第二个algorithmString，第三个 index（初始为0，每执行一个action，就增一）
						
						//System.out.println("modelid"+obj.getInt("modelid"));
						Model model=modelBizImpl.getModelById(obj.getInt("modelid"));
						System.out.println("model+"+model.getAlgorithmString());
						String algorithms = model.getAlgorithmString();
						//System.out.println();
						JSONArray algorithmJSON = new JSONArray(algorithms);
						JSONObject projectJSON =new JSONObject(projectJSONStr);
						Project project=projectBiz.getById(projectid);
						ElementsTasks elementsTasks=new ElementsTasks(projectJSON, algorithmJSON, user,project);
						elementsTasks.turnAlgorithm();
						return "next";
					}
				});
				System.out.println(future.get()+"   "+future.isDone());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
       	return SUCCESS;
		
		
	
	}

	public String delProject(){
//		System.out.println("id"+id);
		projectBiz.delProject(id);
		map = new HashMap<String,Object>();
		map.put("message", "success");
		return "delSuccess";
	}
	public String delProjects(){
//		System.out.println("ids"+ids);
		String temp[] = ids.substring(ids.indexOf("[")+1,ids.indexOf("]")).split(",");
		int p_id[] = new int[temp.length];
		for(int i = 0;i<temp.length;i++){
			p_id[i] = Integer.parseInt(temp[i]);
		}
		projectBiz.delProjects(p_id);
		map = new HashMap<String,Object>();
		map.put("message","success");
		return "delSuccess";
	}
	public String getProjectTree(){
		int adminId = ((Admin)ActionContext.getContext().getSession().get("user")).getId();
		List<Project> list = projectBiz.getProjectTree(adminId);
		JSONArray array = new JSONArray();
		for(int i = 0;i<list.size();i++){
			JSONObject object = new JSONObject();
			object.put("projectId",list.get(i).getP_id());
			object.put("projectName",list.get(i).getP_name());
			array.put(object);
		}
		map = new HashMap<String,Object>();
		map.put("projectData",array.toString());
		return "getSuccess";
	}
}

/*原先的projectaction
<action name="Project_*" class="com.sdu.action.ProjetAction" method="{1}">
<result name="addSuccess" type="json">
	<param name="root">map</param>
</result>
<result name="next" type="redirectAction">
	<param name="actionName">${actionName}</param>
	<param name="algorithmString">${algorithmString}</param>
	<param name="filePath">${fileId}</param>
	<param name="index">0</param>
</result>
</action>
*/
