import models.*;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;

/**
 * RESTful service handler for the Grammys database.
 *
 * @author kr29, based on 'HelloJDBC' by kvlinden
 * @version Spring, 2017
 */
@Stateless
@Path("grammy")
public class GrammyResource {

    /**
     * JPA creates and maintains a managed entity manager with an integrated JTA that we can inject here.
     *     E.g., http://wiki.eclipse.org/EclipseLink/Examples/REST/GettingStarted
     */
    @PersistenceContext
    private EntityManager em;

    /**
     * GET a default message.
     *
     * @return a static hello-world message
     */
    @GET
    @Path("hello")
    @Produces("text/plain")
    public String getClichedMessage() {
        return "Hello, JPA!";
    }

    /**
     * Get the information of a song with a given ID.
     * @return The song's name, artist, album (if applicable), label (if applicable), and the people who worked on it
     */
    @GET
    @Path("song/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public SongEntity getSong(@PathParam("id") long id) {
        return em.find(SongEntity.class, id);
    }

    /**
     * Put (modify) the information of a song with a given ID.
     * @return success message or error message
     */
    @PUT
    @Path("song/{id}")
    @Consumes("models/songentity")
    @Produces(MediaType.APPLICATION_JSON)
    public String modifySong (@PathParam("id") long id, SongEntity song) {
        if (em.find(SongEntity.class, id) != null) {
            em.merge(song);
            return "Song successfully updated!";
        }
        else {
            return "Song not found";
        }
    }

    /**
     * Post the information of a song with a given ID.
     * @return success message or error message
     */
    @POST
    @Path("songs")
    @Consumes("models/songentity")
    @Produces(MediaType.APPLICATION_JSON)
    public String addSong (SongEntity song)
    {
        Query query = em.createQuery("SELECT COUNT(SongEntity) FROM SongEntity s WHERE s.id = ?1");
        query.setParameter(1, song.getId());
        int songExists = (int) query.getSingleResult();
        if (songExists != 1) {
            em.persist(song);
            return "Successfully added song!";
        }
        else {
            return "Song with that ID already exists";
        }
    }

    /**
     * Delete the information of a song with a given ID.
     * @return success message or error message
     */
    @DELETE
    @Path("song/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deleteSong (@PathParam("id") long id)
    {
        SongEntity song = em.find(SongEntity.class, id);
        if (song != null) {
            em.remove(song);
            return "Song successfully deleted!";
        }
        else {
            return "Song not found";
        }
    }

    /**
     * Link a Label of the given ID to a  Song of the given ID.
     * @return success message or error message
     */
    @POST
    @Path("song/{sid}/label/{lid}")
    @Produces(MediaType.APPLICATION_JSON)
    public String addSongLabel(@PathParam("sid") long songId, @PathParam("lid") long labelId)
    {
        SongEntity song = em.find(SongEntity.class, songId);
        LabelEntity label = em.find(LabelEntity.class, labelId);

        if (song == null)
            return "Song not found";
        else if (label == null)
                return "Label not found";

        SonglabelEntityPK pk = new SonglabelEntityPK(songId, labelId);
        SonglabelEntity songlabel = em.find(SonglabelEntity.class, pk);

        em.persist(songlabel);
        return("Label successfully added to song!");
    }

    /**
     * Change the role of a Person linked to an Album. NOTE - since role is part of the primary key, ensure that
     * the person does not already exist in the desired role on the Album.
     * @return success message or error message
     */
    @PUT
    @Path("album/{aid}/person/{pid}/{role}")
    @Produces(MediaType.APPLICATION_JSON)
    public String changePersonAlbumRole(@PathParam("aid") long albumId, @PathParam("pid") long personId, @PathParam("role") String role)
    {
        AlbumEntity album = em.find(AlbumEntity.class, albumId);
        LabelEntity person = em.find(LabelEntity.class, personId);

        if (album == null)
            return "Album not found";
        else if (person == null)
            return "Person not found";

        AlbumpersonEntityPK pk = new AlbumpersonEntityPK(albumId, personId, role);
        SonglabelEntity songlabel = em.find(SonglabelEntity.class, pk);

        songlabel.
    }

}