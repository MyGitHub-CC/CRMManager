package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.TalkRecord;

public interface TalkRecordDao {

	public List<TalkRecord> search(@Param(value="begin")int begin,
			@Param(value="conditionTalk")TalkRecord conditionTalk);
	
	public int searchCount(TalkRecord conditionTalk);

	public TalkRecord searchById(int tId);

	public int update(TalkRecord talkRecord);

	public int insert(TalkRecord talkRecord);

	public int delete(int tId);

}
