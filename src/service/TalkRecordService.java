package service;

import java.util.List;

import entity.TalkRecord;

public interface TalkRecordService {

	public List<TalkRecord> search(int begin,TalkRecord conditionTalk);
	
	public int searchCount(TalkRecord talkRecord);

	public TalkRecord searchById(int tId);

	public int modify(TalkRecord talkRecord);

	public int add(TalkRecord talkRecord);

	public int delete(int tId);

}
