## Step 1: Identify the image with zero CRITICAL Vulnerability

List all the images present 

```bash
docker images
```

![images](../pictures/1_docker_images.PNG)

You will see that all those 6 images are already present in the lab environment.

Next I will show you how to scan those six images with Aquasec Trivy.

*I did not have any knowledge on Aquasec Trivy prior to this lab, but I was still able to complete the task. I was able to do so with just some curiosity and common commands, let me show you how.*

When you click on the *Images* icon, there you will get a hint *Use 'trivy' to find the image with the least number of 'CRITICAL' vulnerability*

Simply run 'trivy' command and observe the output

```bash
root@controlplane$ trivy
```

![images](../pictures/1_trivy.PNG)

Read the ouput, you will get to know that trivy is used to scan images for vulnerabilities and you can run *trivy image* command to scan a an image.

```bash
root@controlplane$ trivy image
```

![images](../pictures/1_trivy_image.PNG)

You can see under the Usage section, there is a sample command on how to scan an image.

Run the following command to scan the image nginx:alpine

```bash
root@controlplane$ trivy image nginx:alpine
```

![images](../pictures/1_trivy_image_nginxalpine.PNG)

You can see that there are no CRITICAL vulnerabilities in nginx:alpine

Similarly scan all the images to find out CRITICAL vulnerability count for all the images.

Run the following commands:

```bash
root@controlplane$ trivy image nginx:alpine
root@controlplane$ trivy image bitnami/nginx
root@controlplane$ trivy image nginx:1.13
root@controlplane$ trivy image nginx:1.17
root@controlplane$ trivy image nginx:1.16
root@controlplane$ trivy image nginx:1.14
```

**NOTE**: You will get detailed view of the scan report for other images as they contain vulnerabilities. The summay of vulnerability count is present at the beginning of the output.

You will find out that the image *nginx:alpine* has the least number of CRITICAL vulnerabilites. So we will be using this image in our deployment.

## Step 2: Enforce the AppArmor profile 

## Step 3: Expose the deployment 

## Step 4: Restrict network traffic with Network Policy