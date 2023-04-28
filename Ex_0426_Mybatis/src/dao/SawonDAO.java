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
	
	//전체 사원 조회
	public List<SawonVO> select() {
		SqlSession sqlSession = factory.openSession();	
		
		List<SawonVO> list = sqlSession.selectList("s.sawon_list"); //파일의 이름을 따라가는 게 아니라 mapper의 namespace속성의 값을 따라간다.
		
		//conn, pstmt, rs 객체를 close하는 내용이 포함되어 있다.
		sqlSession.close();
		
		return list;
	}
	
	//특정 부서 사원 조회
	public List<SawonVO> select(int deptno) {
		
		//1.처리객체 가져오기
		SqlSession sqlSession = factory.openSession();
		
		//2.처리객체를 통해 쿼리작업 수행
		List<SawonVO> list = sqlSession.selectList("s.sawon_list_no", deptno); //파라미터는 하나밖에 가져갈 수 없음
		
		sqlSession.close();
		
		return list;
	}
}


















