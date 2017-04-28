import javax.ws.rs.*;

/**
 * Created by kr29 on 4/28/2017.
 */
@Path("/")
public class RestfulSupport {

    @GET
    @Produces("text/plain")
    public String get() {
        // Return some cliched textual content
        return "Getting";
    }

    @Path("put/{i}")
    @PUT
    @Produces("text/plain")
    public String put(@PathParam("i") int i) {
        return "Putting " + i;
    }

    @Path("post/{j}")
    @PUT
    @Produces("text/plain")
    public String post(@PathParam("j") String j) {
        return "Posting " + j;
    }

    @Path("{k}")
    @DELETE
    @Produces("text/plain")
    public String delete(@PathParam("k") int k) {
        if (k > 9 || k < 0 )
            return "Delete failed";

        return "Deleting " + k;
    }
}
