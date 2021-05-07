package ino.web.freeBoard.service;

import ino.web.freeBoard.dto.FreeBoardDto;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public void freeBoardModify(FreeBoardDto dto){
		sqlSessionTemplate.update("freeBoardModify", dto);
	}

	public void FreeBoardDelete (int num) {
		sqlSessionTemplate.delete("freeBoardDelete", num);

	}

}
