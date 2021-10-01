package be.ipam.spotify2.api.hateoas;

import java.util.Objects;

import org.springframework.beans.BeanUtils;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import be.ipam.spotify2.api.entity.SongEntity;
import be.ipam.spotify2.api.model.Song;
import be.ipam.spotify2.api.controllers.SongController;

@Component
public class SongRepresentationModelAssembler extends RepresentationModelAssemblerSupport<SongEntity,Song> {

	public SongRepresentationModelAssembler() {
		super(SongController.class,Song.class);
	}

	@Override
	public Song toModel(SongEntity entity) {
	    Song resource = new Song();
	    BeanUtils.copyProperties(entity, resource);
	    return resource;
	}

}
