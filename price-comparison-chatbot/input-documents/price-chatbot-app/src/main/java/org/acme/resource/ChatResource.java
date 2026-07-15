package org.acme.resource;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import org.acme.ai.PriceComparisonAI;
import org.acme.model.Product;
import org.acme.service.PriceComparisonService;

import java.util.List;

/**
 * REST API endpoints for the price comparison chatbot
 */
@Path("/api")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ChatResource {

    @Inject
    PriceComparisonAI aiService;

    @Inject
    PriceComparisonService priceService;

    /**
     * Main chat endpoint - send a message and get AI response
     */
    @POST
    @Path("/chat")
    public ChatResponse chat(ChatRequest request) {
        if (request.message == null || request.message.trim().isEmpty()) {
            return new ChatResponse("Please provide a message.", null);
        }

        try {
            String response = aiService.chat(request.message);
            return new ChatResponse(response, null);
        } catch (Exception e) {
            return new ChatResponse("Sorry, I encountered an error processing your request: " + e.getMessage(), null);
        }
    }

    /**
     * Get all available products
     */
    @GET
    @Path("/products")
    public List<Product> getAllProducts() {
        return priceService.getAllProducts();
    }

    /**
     * Search products by name
     */
    @GET
    @Path("/products/search")
    public List<Product> searchProducts(@QueryParam("q") String query) {
        return priceService.findProductsByName(query);
    }

    /**
     * Get products by category
     */
    @GET
    @Path("/products/category/{category}")
    public List<Product> getProductsByCategory(@PathParam("category") String category) {
        return priceService.getProductsByCategory(category);
    }

    /**
     * Health check endpoint
     */
    @GET
    @Path("/health")
    @Produces(MediaType.TEXT_PLAIN)
    public String health() {
        return "Price Comparison Chatbot is running!";
    }

    // Request/Response DTOs
    public static class ChatRequest {
        public String message;

        public ChatRequest() {
        }

        public ChatRequest(String message) {
            this.message = message;
        }
    }

    public static class ChatResponse {
        public String response;
        public Object data;

        public ChatResponse() {
        }

        public ChatResponse(String response, Object data) {
            this.response = response;
            this.data = data;
        }
    }
}
