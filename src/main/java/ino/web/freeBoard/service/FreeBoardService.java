package ino.web.freeBoard.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ino.web.freeBoard.dto.FreeBoardDto;

@Service
public class FreeBoardService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<FreeBoardDto> freeBoardList(){
		return sqlSessionTemplate.selectList("freeBoardGetList");
	}


	public Map<String, Object> freeBoardInsertPro(Map<String, Object> iMap){
		
		try {
			sqlSessionTemplate.insert("freeBoardInsertPro",iMap);
			iMap.put("result", "true");
			iMap.put("num", getNewNum());
		} catch (Exception e) {
			iMap.put("result", "false");
		}
		return iMap;
	}

	public Map<String, Object> getDetailByNum(int num){
		return sqlSessionTemplate.selectOne("freeBoardDetailByNum", num);
	}

	public int getNewNum(){
		return sqlSessionTemplate.selectOne("freeBoardNewNum");
	}

	public Map<String, Object> freeBoardModify(Map<String, Object> mMap){
		
		try {
			sqlSessionTemplate.update("freeBoardModify",mMap);
			mMap.put("result", "true");
		} catch (Exception e) {
			mMap.put("result", "false");
		}
		
		return mMap;
	}

	public void FreeBoardDelete (int num) {
		sqlSessionTemplate.delete("freeBoardDelete", num);

	}
	public List<Map<String, Object>> codeSelect(){
		return sqlSessionTemplate.selectList("codeSelect");
	}
	public List<Map<String, Object>> typeSelect(){
		return sqlSessionTemplate.selectList("typeSelect");
	}

}
