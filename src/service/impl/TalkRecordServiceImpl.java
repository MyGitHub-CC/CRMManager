package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TalkRecordDao;

import service.TalkRecordService;
import entity.TalkRecord;

@Service
public class TalkRecordServiceImpl implements TalkRecordService {

	@Autowired
	TalkRecordDao trDao;
	
	@Override
	public List<TalkRecord> search(int begin, TalkRecord conditionTalk) {
		return trDao.search(begin, conditionTalk);
	}

	@Override
	public int searchCount(TalkRecord talkRecord) {
		return trDao.searchCount(talkRecord);
	}

	@Override
	public TalkRecord searchById(int tId) {
		return trDao.searchById(tId);
	}

	@Override
	public int modify(TalkRecord talkRecord) {
		return trDao.update(talkRecord);
	}

	@Override
	public int add(TalkRecord talkRecord) {
		return trDao.insert(talkRecord);
	}

	@Override
	public int delete(int tId) {
		return trDao.delete(tId);
	}

}
