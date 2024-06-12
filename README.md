# Application Documentation

## Tools Used

1. **Docker**: Containerization platform used for packaging applications and their dependencies.
2. **AWS and AWS CLI**: Cloud computing platform and its command-line interface used for managing AWS services.
3. **Git**: Version control system used for tracking changes in the application codebase.
4. **Ansible**: Configuration management tool used for automating the deployment and configuration of infrastructure.
5. **Terraform**: Infrastructure as Code (IaC) tool used for provisioning and managing AWS infrastructure.
6. **SSM Parameter**: AWS Systems Manager Parameter Store used for storing Doppler token.
7. **Doppler**: Secret and configuration management tool used for managing application secrets and environment variables.

## Infrastructure Diagram

![Untitled Diagram drawio](https://github.com/anshultaak/demo-app/assets/76546821/0a036e02-16a1-491e-910c-3d8e5174727e)

## Infrastructure Setup

1. **Terraform Setup**:
   - Infrastructures have been set up by Terraform.
   - Make sure Terraform is installed on your local machine.
   - Change directory to `cd terraform/dev`.
   - Ensure AWS CLI has been configured and update the profile name in `main.tf`.
   - Run `terraform init` command to initialize Terraform configurations.

2. **Ansible Setup**:
   - Install required packages on the server using Ansible.
   - Make sure Ansible is installed on your system.
   - Change directory to `cd ansible`.
   - Run the Ansible playbook using the following command:
     ```
     ansible-playbook -i dev main.yaml -u ubuntu --private-key $PRIVATE_KEY_PATH
     ```
   - Ansible will install AWS CLI, Docker, Git, Zip, Task, and Doppler packages on the server.

## Deploy the Application

1. **Clone Repository and Deploy**:
   - SSH into the server: `ssh ubuntu@IP -i $PRIVATE_KEY_PATH`.
   - Clone the repository: `git clone https://github.com/anshultaak/demo-app.git`.
   - Run the `taskfile.yaml` to deploy the application.
     - Use `task deploy_app` command to deploy the application.
     - Use `task clean` command to clean the running Docker containers.

## Taskfile.yaml Explanation

1. **Environment Configuration**:
   - Define environment variables in the YAML file:
     - `container_name`: Name of the application container.
     - `hadolint_config`: Path to the Hadolint YAML file.
     - `hadolint_image`: Name of the Hadolint Docker image.
     - `local_port`: Local server port to access the application.
     - `container_port`: Port inside the Docker container.

2. **Tasks**:
   - **build**: Docker image build command.
   - **lint**: Review Dockerfile using Hadolint for code quality.
   - **deploy**: Deploy the application with Doppler.
   - **deploywithdoppler**: Deploy the application using Doppler environment.
   - **test**: Run `test.sh` script to check application functionality.
   - **clean**: Clean the running Docker containers.
   - **deploy_app**: Run multiple tasks together: build, lint, deploywithdoppler, and test.

## Hadolint Explanation

1. **Purpose**:
   - Hadolint is used to lint your Dockerfile, ensuring it follows best practices and coding standards.

2. **Configuration**:
   - Configuration for Hadolint is defined in the `hadolint.yaml` file.
   - Key configuration options include:
     - **failure-threshold**: Specifies the threshold level for reporting issues (e.g., `error`, `warning`, `info`, `style`, `ignore`, `none`).
     - **trustedRegistries**: Defines trusted URLs that can be used in the Dockerfile.
     - **ignored**: Specifies which errors should be ignored during linting.

3. **Documentation**:
   - For more detailed information and additional configuration options, refer to the [Hadolint documentation](https://github.com/hadolint/hadolint).
