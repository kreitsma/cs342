import models.Household;
import models.Person;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
@Path("cpdb")
public class CPDBResource {

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
     * GET an individual person record.
     *
     * @param id the ID of the person to retrieve
     * @return a person record
     */
    @GET
    @Path("person/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Person getPerson(@PathParam("id") long id) {
        return em.find(Person.class, id);
    }

    /**
     * GET all people using the criteria query API.
     * This could be refactored to use a JPQL query, but this entitymanager-based approach
     * is consistent with the other handlers.
     *
     * @return a list of all person records
     */
    @GET
    @Path("people")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Person> getPeople() {
        return em.createQuery(em.getCriteriaBuilder().createQuery(Person.class)).getResultList();
    }

    @PUT
    @Path("person/{id}")
    @Consumes("models/person")
    @Produces(MediaType.APPLICATION_JSON)
    public String modifyPerson (@PathParam("id") long id, Person person)
    {
        if (em.find(Person.class, id) != null) {
            em.merge(person);
            return "Person successfully updated!";
        }
        else {
            return "Person not found";
        }
    }

    @POST
    @Path("people")
    @Consumes("models/person")
    @Produces(MediaType.APPLICATION_JSON)
    public String addPerson (Person person)
    {
        //Get the next Id by creating a new person and getting its ID that is assigned to it
        Person nextid = new Person();
        person.setId(nextid.getId());
        long householdId =  person.getHousehold().getId();
        person.setHousehold(em.find(Household.class, householdId));
        em.persist(person);
        return "Successfully added person!";
    }

    @DELETE
    @Path("person/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String deletePerson (@PathParam("id") long id)
    {
        Person person = em.find(Person.class, id);
        if (person != null) {
            em.remove(person);
            return "Person successfully deleted!";
        }
        else {
            return "Person not found";
        }
    }

}