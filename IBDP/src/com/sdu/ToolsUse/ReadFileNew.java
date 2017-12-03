package com.sdu.ToolsUse;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.csvreader.CsvReader;
import com.sdu.entity.DataNew;

public class ReadFileNew {
	public static final String EMPTY = "";
	public static final String POINT = ".";
	public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
	public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";
	public static final String NOT_EXCEL_FILE = " : Not the Excel file!";
	
	public static List<DataNew> readtxt(String filePath) throws Exception{
		List<DataNew> list=new ArrayList<DataNew>();
		list.clear();
		//放每一行的每一个列值
		String data = "";
		CsvReader reader = new CsvReader(filePath, '，', Charset.forName("GBK"));
		//循环每一行
		//while (reader.readRecord()) {
		int sizeTemp = 0;
		for(int rowNum = 0; reader.readRecord(); rowNum++){
			
				sizeTemp = sizeTemp + 1 ;
				DataNew vo = new DataNew();
				vo.setLineNo(rowNum);
				//循环列
				List<String> dataList = new ArrayList<String>();
				for(int i=0;;i++){
					data = reader.get(i);
					if(data == ""){
						
						break;
					}
					dataList.add(data);
					//System.out.println(data);
				}
				vo.setData(dataList);
				list.add(vo);
			}
		
		return list;
	}
	
	public static int txtlen(String filePath) throws Exception{
		int colnum = 0;
		int coltem = 0;
		CsvReader reader = new CsvReader(filePath, '，', Charset.forName("GBK"));
		//放每一行的每一个列值
		String data = "";
		int sizeTemp = 0;
		for(int rowNum = 0; reader.readRecord(); rowNum++){
				sizeTemp = sizeTemp + 1 ;
				
				for(int i=0;;i++){
					data = reader.get(i);
					String[] split = data.split(",");
					coltem = split.length;
					if(data == ""){
						break;
					}
				}
				
				if(coltem > colnum){
					colnum = coltem;
				}
			}
		System.out.println(colnum);
		return colnum;
	}
	
	public static List<DataNew> readcsv(String filePath) throws Exception{
		List<DataNew> list=new ArrayList<DataNew>();
		list.clear();
		//放每一行的每一个列值
		String data = "";
		CsvReader reader = new CsvReader(filePath, ',', Charset.forName("GBK"));
		
		//循环每一行
		//while (reader.readRecord()) {
		int sizeTemp = 0;
		for(int rowNum = 0; reader.readRecord(); rowNum++){
				sizeTemp = sizeTemp + 1 ;
				DataNew vo = new DataNew();
				vo.setLineNo(rowNum);
				//循环列
				List<String> dataList = new ArrayList<String>();
				for(int i=0;;i++){
					data = reader.get(i);
					if(data == ""){
						break;
					}
					dataList.add(data);
					//System.out.println(data);
				}
				vo.setData(dataList);
				list.add(vo);
			}
		
		return list;
	}

	public static int csvlen(String filePath) throws Exception{
		int colnum = 0;
		int coltem = 0;
		CsvReader reader = new CsvReader(filePath, '，', Charset.forName("GBK"));
		//放每一行的每一个列值
		String data = "";
		int sizeTemp = 0;
		for(int rowNum = 0; reader.readRecord(); rowNum++){
				sizeTemp = sizeTemp + 1 ;
				
				for(int i=0;;i++){
					data = reader.get(i);
					String[] split = data.split(",");
					coltem = split.length;
					if(coltem > colnum){
						colnum = coltem;
					}
					if(data == ""){
						break;
					}
				}
				
			}
		System.out.println(colnum);
		return colnum;
	}
	
	public static List<DataNew> readexcel(String path) throws IOException {
		String postfix = getPostfix(path);
		if (!EMPTY.equals(postfix)) {
			if (OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
				try {
					return readxls(path);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
				return readxlsx(path);
			}
		} else {
			//System.out.println(path + NOT_EXCEL_FILE);
		}
		return null;
	}
	
	public static int excellen(String path) throws IOException {
		String postfix = getPostfix(path);
		if (!EMPTY.equals(postfix)) {
			if (OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
				try {
					return xlslen(path);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
				return xlsxlen(path);
			}
		} else {
			//System.out.println(path + NOT_EXCEL_FILE);
		}
		return 0;
	}
	
	public static String getPostfix(String path) {
		if (path == null || EMPTY.equals(path.trim())) {
			return EMPTY;
		}
		if (path.contains(POINT)) {
			return path.substring(path.lastIndexOf(POINT) + 1, path.length());
		}
		return EMPTY;
	}
	
	public static List<DataNew> readxlsx(String path) throws IOException {
		List<DataNew> list = new ArrayList<DataNew>();
		list.clear();
		InputStream is = new FileInputStream(path);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		// 循环行Row     
        for(int rowNum = 0; rowNum <= xssfSheet.getLastRowNum(); rowNum++ ){    
          XSSFRow xssfRow = xssfSheet.getRow( rowNum); 
          DataNew vo = new DataNew();
		  vo.setLineNo(rowNum+1);
          if(xssfRow == null){    
            continue;    
          }    
          // 循环列Cell  
          List<String> dataList = new ArrayList<String>();
          for(int cellNum = 0; cellNum <= xssfRow.getLastCellNum(); cellNum++){    
            XSSFCell xssfCell = xssfRow.getCell( cellNum);    
            if(xssfCell == null){    
              continue;    
            }    
            //System.out.print("   "+getsValue(xssfCell));
            dataList.add(getsValue(xssfCell));
          }     
          vo.setData(dataList);
          list.add(vo);
        }       
		return list;
	}
	
	public static int xlsxlen(String path) throws IOException {
		int collen=0;
		int coltem=0;
		InputStream is = new FileInputStream(path);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
		// 循环行Row     
        for(int rowNum = 0; rowNum <= xssfSheet.getLastRowNum(); rowNum++ ){    
          XSSFRow xssfRow = xssfSheet.getRow( rowNum); 
          if(xssfRow == null){    
            continue;    
          }    
          coltem = xssfRow.getLastCellNum();
          if(coltem>collen){
        	  collen=coltem;
          }
        }      
        System.out.println(collen);
		return collen;
	}
	
	 public static String getsValue(XSSFCell xssfCell){    
	        if(xssfCell.getCellType() == xssfCell.CELL_TYPE_BOOLEAN){    
	          return String.valueOf( xssfCell.getBooleanCellValue());    
	        }else if(xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC){    
	          return String.valueOf( xssfCell.getNumericCellValue());    
	        }else{    
	          return String.valueOf( xssfCell.getStringCellValue());    
	        }    
	      }    
	
	public static List<DataNew> readxls(String filePath) throws Exception{
		List<DataNew> list = new ArrayList<DataNew>();
		list.clear();
		InputStream is = new FileInputStream(filePath);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		//定义存放XLS的每一行变量
		HSSFRow hssfRow = null;
		//定义存放每一行的每一列的值的变量
		String currCellValue = "";
		// 循环行所有行
		int sizeTemp = 0;
		for (int rowNum = 0; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
			
				sizeTemp = sizeTemp + 1 ;
				hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow == null) {
					continue;
				}
				DataNew vo = new DataNew();
				vo.setLineNo(rowNum+1);
				//获取列数
				int columnNum=hssfRow.getPhysicalNumberOfCells();
				List<String> dataList = new ArrayList<String>();
				for(int i=0;i<columnNum;i++){
					currCellValue = printCellValue(hssfRow.getCell(i));
					dataList.add(currCellValue);
					//System.out.println(currCellValue);
				}
				vo.setData(dataList);
				list.add(vo);
			}
		return list;
	}
	
public static int xlslen(String fileName) throws Exception{
		
		int collen=0;
		InputStream is = new FileInputStream(fileName);
		HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
		HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
		//定义存放XLS的每一行变量
		HSSFRow hssfRow = null;
		// 循环行所有行
		int sizeTemp = 0;
		for (int rowNum = 0; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
			sizeTemp = sizeTemp + 1 ;
			hssfRow = hssfSheet.getRow(rowNum);
			if (hssfRow == null) {
				continue;
			}
			//获取列数
			int collennew=hssfRow.getPhysicalNumberOfCells();
			if(collennew>collen){
				collen=collennew;
			}
		}
		System.out.println(collen);
		return collen;
	}
	
	//获取excel列值
	public static String printCellValue(HSSFCell c) {
		String cellVal = null;
		double cellValDoub = 0.0;

		if (c != null) {
			int cellType = c.getCellType();

			if (cellType == HSSFCell.CELL_TYPE_BOOLEAN) {
				cellVal = String.valueOf(c.getBooleanCellValue());
			} else if (cellType == HSSFCell.CELL_TYPE_STRING) {
				cellVal = c.getRichStringCellValue().getString();
			} else if (cellType == HSSFCell.CELL_TYPE_FORMULA) {

				int type = c.getCachedFormulaResultType();

				if (type == 0) {
					cellVal = String.valueOf(c.getNumericCellValue());
					if (cellVal.equalsIgnoreCase("NaN")) {
						cellVal = c.getRichStringCellValue().getString();
					} else {
						String date = null;
						if (HSSFDateUtil.isCellDateFormatted(c)) {
							java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
									"dd-MMM-yyyy HH:mm:ss");
							date = formatter.format(HSSFDateUtil.getJavaDate(c
									.getNumericCellValue()));
							cellVal = date;
						} else {
							cellValDoub = c.getNumericCellValue();
							NumberFormat df = new DecimalFormat("##.####");
							cellVal = df.format(cellValDoub).toString();
							// String.valueOf(c.getNumericCellValue());
						}
					}
				} else if (type == 1) {
					cellVal = c.getRichStringCellValue().getString();
				} else {
					cellVal = "";
				}
			} else if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
				String date = null;
				if (HSSFDateUtil.isCellDateFormatted(c)) {
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
					date = formatter.format(HSSFDateUtil.getJavaDate(c
							.getNumericCellValue()));
					cellVal = date;
				} else {
					cellValDoub = c.getNumericCellValue();
					NumberFormat df = new DecimalFormat("##");
					cellVal = df.format(cellValDoub).toString();
					// cellVal = String.valueOf(c.getNumericCellValue());
				}
			} else if (cellType == HSSFCell.CELL_TYPE_ERROR) {
				cellVal = String.valueOf(c.getErrorCellValue());
			} else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
				cellVal = "";
			}
		} else {
			cellVal = "";
		}
		return cellVal.trim();
	}
}
