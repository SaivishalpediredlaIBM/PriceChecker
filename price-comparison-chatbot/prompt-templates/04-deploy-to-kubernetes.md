# Deploy to Kubernetes

**Mode:** Price Comparison Expert

**Context:**

This prompt helps you create Kubernetes deployment manifests and deploy the price comparison chatbot to a Kubernetes cluster.

**Prompt:**

```
I want to deploy the price comparison chatbot to Kubernetes. Please:

1. Create a Dockerfile for the application
2. Generate Kubernetes deployment manifest with:
   - Deployment with 2 replicas
   - Service (LoadBalancer type)
   - ConfigMap for non-sensitive configuration
   - Secret for API keys
3. Add resource limits and health checks
4. Create instructions for building and deploying

Environment:
- Kubernetes cluster: [CLUSTER_NAME]
- Namespace: price-comparison
- Database: PostgreSQL (external)
```

**Expected Result:**

- Dockerfile created in src/main/docker/
- Kubernetes manifests in optional-generated-content/
- Deployment instructions in README
- Application successfully deployed and accessible

**Follow-up Actions:**

- Test the deployed application
- Set up monitoring and logging
- Configure autoscaling if needed
- Set up CI/CD pipeline

---