package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.TalkRecordService;
import dao.CustomerDao;
import dao.TalkRecordDao;
import entity.TalkRecord;

@Service
public class TalkRecordServiceImpl implements TalkRecordService {

	@Autowired
	TalkRecordDao trDao;
	@Autowired
	CustomerDao cusDao;

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
		int result = trDao.update(talkRecord);
		int result2 = 0;
		if (result > 0) {
			int cId = talkRecord.getCustomer().getId();
			TalkRecord talkRecord2 = trDao.searchMaxCId(cId);
			result2 = cusDao.updateTalkRecord(talkRecord2);
		}
		return result2;
	}

	@Override
	public int add(TalkRecord talkRecord) {
		int result = trDao.insert(talkRecord);
		int result2 = 0;
		if (result > 0) {
			int cId = talkRecord.getCustomer().getId();
			TalkRecord talkRecord2 = trDao.searchMaxCId(cId);
			result2 = cusDao.updateTalkRecord(talkRecord2);
		}
		return result2;
	}

	@Override
	public int delete(TalkRecord talkRecord) {
		int result = trDao.delete(talkRecord);
		int result2 = 0;
		if (result > 0) {
			int cId = talkRecord.getCustomer().getId();
			TalkRecord talkRecord2 = trDao.searchMaxCId(cId);
			if (talkRecord2 == null) {
				result2 = cusDao.deleteUpdate(cId, 2);
			} else {
				result2 = cusDao.updateTalkRecord(talkRecord2);
			}
		}
		return result2;
	}

	@Override
	public List<TalkRecord> searchBySupervision() {
		return trDao.searchBySupervision();
	}

	@Override
	public int addModify(List<TalkRecord> talkRecords) {
		int result = -1;
		for (int i = 0; i < talkRecords.size(); i++) {
			result = trDao.addModify(talkRecords.get(i));
			if (result <= 0) {
				break;
			}
		}
		return result;
	}

}
