var algorithmJSONList=[
[//数据清理算法
	{
    				name:'数据缺失值处理',
    				actionName:'DplyrMethods',
    				method:'na',
    				introduction:'数据缺失值处理',
    				param:[
    					{name:'依据列',field:'NaVariable',type:'String'}    					
    				]
    			},
    			{
    				name:'变量选择（select）',
    				actionName:'DplyrMethods',
    				method:'select',
    				introduction:'变量选择是数据处理的一种方法',
    				param:[
    					
    					{name:'选择变量',field:'CollectVariable',type:'String'}
    				]
    			},
    			{
    				name:'变量筛选（filter）',
    				actionName:'DplyrMethods',
    				method:'filter',
    				introduction:'变量筛选（filter）可以按给定的逻辑条件筛选出符合要求的子数据集',
    				param:[
    					
    					{name:'筛选条件',field:'FilterVariable',type:'String'}
    				]
    			},
    			{
    				name:'数据去重（distinct）',
    				actionName:'DplyrMethods',
    				method:'distinct',
    				introduction:'数据去重可以根据某些变量或变量的运算结果进行去重',
    				param:[
    					
    					{name:'去重变量',field:'DistinctVariable',type:'String'},
    					
    					{name:'去重后返回变量',field:'ReturnVariable',type:'String'}
    				]
    			},
    			{
    				name:'数据取样（sample）',
    				actionName:'DplyrMethods',
    				method:'sample_n',
    				introduction:'随机抽取指定数目的样本',
    				param:[
    					
    					{name:'抽取样本数',field:'SampleNumber',type:'String'},
    					
    					{name:'是否有放回抽样',field:'repalce',type:'select',options:['是','否'],value:''}
    				]
    			}
],
[//数据分析算法
				{
						name:'统计量分析',
						actionName:'statisticsMethod',
						introduction:'统计量分析',
						guide:'1.这里可以写一些写作指导内容 !',
						param:[
						   	{name:'分析列',field:'column',type:'String'},
							{name:'统计量',field:'s',type:'checkbox',options:['均值','中位数','众数','极差','标准差','第一四分位数','第三四分位数','变异系数'],value:[]}  		
							
						]
				},
    			
    			{
    				name:'贝叶斯算法',
    				actionName:'BayesMethod',
    				introduction:'R语言中的关于贝叶斯的一种算法',
    				param:[
    					{name:'公式',field:'formula',type:'String'}
    				]
    			},
    			{
    				name:'相关性计算',
    				based:'R',
    				actionName:'CorrelationMethod',
    				introduction:'用于计算相关性的算法',
    				param:[
    				    {name:'相关性算法',field:'chosework',type:'select',options:['kendall','spearman','pearson'],value:''},
    					{name:'所要计算的列',field:'chosecolumn',type:'String'}
    				]
    			},
    			{
    				name:'决策树(基于R)',
    				based:'R',
    				actionName:'DecisionTreeMethod',
    				introduction:'用于计算相关性的算法',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			},
    			{
    				name:'决策树(基于Spark_MLlib)',
    				based:'Spark',
    				actionName:'DecisionTreeMethod',
    				introduction:'用于计算相关性的算法',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			},
    			{
    				name:'主成分分析(基于R)',
    				based:'R',
    				actionName:'PCAMethod',
    				introduction:'主成分分析就是从事务错综复杂的关系中找出部分主成分进行定量分析，从而实现降维和简化的作用',
    				param:[
       					{name:'所选列',field:'column',type:'String'}       		
       				]
    			},
    			{
    				name:'主成分分析(基于Spark_MLlib)',
    				actionName:'PCAMethod',
    				based:'Spark',
    				introduction:'主成分分析就是从事务错综复杂的关系中找出部分主成分进行定量分析，从而实现降维和简化的作用',
    				param:[
       					{name:'所选列',field:'column',type:'String'}       		
       				]
    			},
    			{
    				name:'BP神经网络',
    				actionName:'BPMethod',
    				introduction:'BP神经网络是一种按误差逆传播算法训练的多层前馈网络',
    				param:[
       					{name:'公式',field:'formula',type:'String'},
       					{name:'隐藏层神经元数量',field:'size',type:'String'},
       					{name:'最大迭代次数',field:'maxit',type:'String'}    		
       				]
    			},
    			{
    				name:'多层感知机（基于Spark_MLlib）',
    				actionName:'BPMethod',
    				based:'Spark',
    				introduction:'BP神经网络是一种按误差逆传播算法训练的多层前馈网络',
    				param:[
       					{name:'公式',field:'formula',type:'String'},
       					{name:'层',field:'size',type:'String'},
       					{name:'最大迭代次数',field:'maxit',type:'String'}    		
       				]
    			},
    			{
    				name:'随机森林（基于Spark_MLlib）',
    				based:'Spark',
    				actionName:'RandomForestMethod',
    				introduction:'随机森林是一个包含多个决策树的分类器',
    				param:[
       					{name:'公式',field:'formula',type:'String'}   		
       				]
    			},
    			{
    				name:'Kmeans(基于R)',
    				based:'R',
    				actionName:'KmeansMethod',
    				introduction:'Kmeans算法接受参数 k ；然后将事先输入的n个数据对象划分为 k个聚类以便使得所获得的聚类满足：同一聚类中的对象相似度较高；而不同聚类中的对象相似度较小',
    				param:[
    				    {name:'依据列',field:'column',type:'String'},   	  
       					{name:'聚类个数',field:'centers',type:'String'}   		
       				]
    			},
    			{
    				name:'Kmeans(基于Spark_MLlib)',
    				based:'Spark',
    				actionName:'KmeansMethod',
    				introduction:'Kmeans算法接受参数 k ；然后将事先输入的n个数据对象划分为 k个聚类以便使得所获得的聚类满足：同一聚类中的对象相似度较高；而不同聚类中的对象相似度较小',
    				param:[
    				    {name:'依据列',field:'column',type:'String'},   	
       					{name:'聚类个数',field:'centers',type:'String'}   		
       				]
    			},
    			{
    				name:'层次聚类',
    				based:'R',
    				actionName:'HclusterMethod',
    				introduction:'层次聚类',
    				guide:'层次聚类有4中不同的联结方法：single、complete、average、centroid，average联结通常被认为是最合适的！',
    				param:[
       					{name:'联结方法',field:'metric',type:'select',options:['single','complete','average','centroid'],value:''},
       					{name:'是否分割分层聚类',field:'cut',type:'select',options:['是','否'],value:''},
       					{name:'分割分层聚类数',field:'cutnumber',type:'String',dependon:'2'}//该参数的是否显示依赖于第‘2’个参数的选择。注意！！！ 依赖于的参数（这里指‘是否分割分层聚类’）,其选项必须设置为[‘是’，‘否’]，否则会报错
       				]
    			},
    			{
    				name:'线性回归(基于R)',
    				based:'R',
    				actionName:'RegressionMethod',
    				introduction:'线性回归(Linear Regression)是利用称为线性回归方程的最小平方函数对一个或多个自变量和因变量之间关系进行建模的一种回归分析',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			},
    			{
    				name:'线性回归(基于Spark_MLlib)',
    				based:'Spark',
    				actionName:'RegressionMethod',
    				introduction:'线性回归(Linear Regression)是利用称为线性回归方程的最小平方函数对一个或多个自变量和因变量之间关系进行建模的一种回归分析',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			},
    			{
    				name:'Logistic回归(基于R)',
    				based:'R',
    				actionName:'LogisticMethod',
    				introduction:'logistic回归是一种广义线性回归（generalized linear model）',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			},
    			{
    				name:'Logistic回归(基于Spark_MLlib)',
    				based:'Spark',
    				actionName:'LogisticMethod',
    				introduction:'logistic回归是一种广义线性回归（generalized linear model）',
    				param:[
       					{name:'公式',field:'formula',type:'String'}
       				]
    			}
    			]];