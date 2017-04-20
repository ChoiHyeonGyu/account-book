package myBatisSetting;



import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class SqlMapConfig {
    //작성한 sqlMapConfig.xml 객체화 하는 클래스
	
   private static SqlSessionFactory sqlsession;
   
   static{
	  try {
		  
		String resource ="./myBatisSetting/sqlMapConfig.xml";
		  Reader reader = Resources.getResourceAsReader(resource); 
		  sqlsession = new SqlSessionFactoryBuilder().build(reader);
		  reader.close();
		  
	 
	  } catch (IOException e) {
		  
		e.printStackTrace();
		throw new RuntimeException("초기화 에러: "+ e);
	
	  }
   }
   
   public static SqlSessionFactory getSqlMapInstance(){
	
	   return sqlsession;
   }
   
}



