package be.ipam.spotify2.api.controllers;

import static org.springframework.http.ResponseEntity.ok;

import java.math.BigDecimal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import be.ipam.spotify2.api.SongApi;
import be.ipam.spotify2.api.hateoas.SongRepresentationModelAssembler;
import be.ipam.spotify2.api.model.Song;
import be.ipam.spotify2.api.service.SongService;

@RestController
public class SongController implements SongApi {
	
	private static final Logger log = LoggerFactory.getLogger(SongController.class);

	
	SongService service;
	SongRepresentationModelAssembler assembler;
	
	public SongController(SongService service, SongRepresentationModelAssembler assembler) {
	    this.service = service;
	    this.assembler = assembler;
	  }
	
	
	@Override
	public ResponseEntity<Void> deleteSong(BigDecimal songId) {
		log.info("Delete");
		// TODO Auto-generated method stub
		return SongApi.super.deleteSong(songId);
	}

	@Override
	public ResponseEntity<Song> getSongById(Integer songId) {
		log.info("Get Song");
		return ok(assembler.toModel(service.songBySongId(songId)));
	}

}
