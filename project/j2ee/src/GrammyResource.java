import models.SongEntity;

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
 * This stateless session bean serves as a RESTful resource handler for the CPDB.
 * It uses a container-managed entity manager.
 *
 * @author kvlinden
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

    @GET
    @Path("song/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public SongEntity getSong(@PathParam("id") long id) {
        return em.find(SongEntity.class, id);
    }

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

    
}