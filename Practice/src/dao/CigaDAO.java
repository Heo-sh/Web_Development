package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MybatisConnector;
import vo.CigaVO;

public class CigaDAO {
	SqlSessionFactory factory;
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CigaDAO single = null;

	public static CigaDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CigaDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	public CigaDAO() {
		factory = MybatisConnector.getInstance().getFactory();
	}
	
	public List<CigaVO> select() {
		SqlSession sqlSession = factory.openSession();
		
		List<CigaVO> list = sqlSession.selectList("c.ciga_list");
		
		sqlSession.close();
		
		return list;
	}
}
