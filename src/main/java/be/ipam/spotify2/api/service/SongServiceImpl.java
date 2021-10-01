package be.ipam.spotify2.api.service;

import org.springframework.stereotype.Service;

import be.ipam.spotify2.api.repository.SongRepository;
import be.ipam.spotify2.api.entity.SongEntity;

@Service
public class SongServiceImpl implements SongService {

	private SongRepository songRep;
	
	public SongServiceImpl(SongRepository songRep) {
		this.songRep=songRep;
	}
	
	
	@Override
	public SongEntity songBySongId(long songId) {
		return this.songRep.findById(songId).get();
	}

}
