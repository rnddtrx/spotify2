package be.ipam.spotify2.api.service;

import be.ipam.spotify2.api.entity.SongEntity;

public interface SongService {
	public SongEntity songBySongId(long songId);
}
