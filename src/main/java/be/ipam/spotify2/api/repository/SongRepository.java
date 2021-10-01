package be.ipam.spotify2.api.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import be.ipam.spotify2.api.entity.SongEntity;

@Repository
public interface SongRepository extends CrudRepository<SongEntity,Long> {

}
