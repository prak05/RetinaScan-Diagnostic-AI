# RetinaScan Diagnostic AI — Multimodal Ophthalmology Screening

[![AWS SageMaker](https://img.shields.io/badge/AWS-SageMaker%20%7C%20S3-FF9900?logo=amazon-aws&logoColor=white)](#aws-cloud-architecture)
[![Client](https://img.shields.io/badge/Client-Flutter%20Mobile%20%7C%20Vite%20Web-0052CC)](#client-architecture)
[![Branch Status](https://img.shields.io/badge/Preservation-Ex%20Branch-22C55E)](#branch-architecture)
[![License: MIT](https://img.shields.io/badge/License-MIT-gray.svg)](LICENSE)

> Deep learning retinal fundus examination and diagnostic decision support for diabetic retinopathy and macular edema screening.

---

## 1. Executive Brief
Preventable vision loss can be reduced significantly with early retinal screening. **RetinaScan Diagnostic AI** accepts fundus photography via mobile Flutter clients and web terminals, applying convolutional feature extractors and Gemini/Bedrock multimodal reasoning to detect microaneurysms and exudates.

* **Preservation**: Original GDG prototype preserved on [`Ex`](https://github.com/prak05/RetinaScan-Diagnostic-AI/tree/Ex).
* **Modernized Pipeline**: Serverless image processing pipeline backed by AWS SageMaker inference and TruLens quality evaluations.

---

## 2. AWS Cloud Architecture

```mermaid
flowchart TD
    Fundus["Fundus Camera / Mobile"] --> APIGW["Amazon API Gateway"]
    APIGW --> S3Raw["Amazon S3 (Fundus Scan Vault)"]
    S3Raw --> LambdaCrop["AWS Lambda (Macula & Disc Preprocessing)"]
    LambdaCrop --> SageMaker["Amazon SageMaker (PyTorch Deep ResNet)"]
    SageMaker --> BedrockMulti["Amazon Bedrock (Multimodal Diagnostic Report)"]
    BedrockMulti --> Dynamo["Amazon DynamoDB (Screening Records)"]
    Dynamo --> Clinician["Ophthalmologist Review Portal"]
```

---

## 3. Branch Architecture
* [`main`](https://github.com/prak05/RetinaScan-Diagnostic-AI/tree/main): Production multimodal inference service with TruLens verification.
* [`Ex`](https://github.com/prak05/RetinaScan-Diagnostic-AI/tree/Ex): Preserved initial GDG prototype.

<!-- antigravity-certified -->
