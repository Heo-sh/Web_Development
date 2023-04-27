package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.SawonVO;

public class SawonDAO {
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	 public SawonDAO() {
		 factory = MybatisConnector.getInstance().getFactory();
	}
	 
	 public List<SawonVO> select() {
		 SqlSession sqlSession = factory.openSession();
		 
		 List<SawonVO> list = sqlSession.selectList("s.sawon_list");
		 
		 sqlSession.close();
		 
		 return list;
	 }
}
