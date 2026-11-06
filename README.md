<div align="center">

# 👁️ RetinaScan Diagnostic AI
### Multimodal Ophthalmology Screening & Retinopathy Detection Engine

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&pause=1200&color=EC4899&center=true&vCenter=true&width=750&lines=RetinaScan+Diagnostic+AI;Multimodal+Ophthalmology+Screening;SageMaker+Computer+Vision+%2B+TruLens;Diabetic+Retinopathy+%26+Maculopathy+Detection" alt="Typing SVG" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/AWS-SageMaker_CV-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white" />
  <img src="https://img.shields.io/badge/Client-Flutter_Mobile_%7C_Vite-0052CC?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Metrics-TruLens_Verified-22C55E?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Preserved-Branch_Ex-gray?style=for-the-badge&logo=git" />
</p>

<img src="https://skillicons.dev/icons?i=pytorch,flutter,ts,aws,docker,vite&theme=dark" alt="Stack" />

</div>

---

### 🔬 Ophthalmic Scan HUD

```yaml
Scan Type      : Digital Color Fundus Photography (50° Field of View)
Resolution     : 2048 x 1536 @ 24-bit RGB
Preprocessing  : Circular FOV Masking, CLAHE Contrast Enhancement
Detected Path  : Microaneurysms, Hard Exudates, Cotton Wool Spots
Classification : Moderate Non-Proliferative Diabetic Retinopathy (NPDR)
Recommendation : Urgent Referral to Retinal Specialist (within 2-4 weeks)
```

---

## 🏛️ Diagnostic Bento Grid

<table width="100%">
  <tr>
    <td width="50%" valign="top">
      <h3>👁️ Deep ResNet Computer Vision</h3>
      <p>Custom PyTorch convolutional neural network trained on balanced fundus datasets. Extracts fine-grained vascular patterns and classifies International Clinical Diabetic Retinopathy (ICDR) stages.</p>
      <b>Features:</b> 5-stage grading • Macular edema detection
    </td>
    <td width="50%" valign="top">
      <h3>📱 Cross-Platform Flutter Client</h3>
      <p>High-performance mobile application allowing point-of-care clinicians to attach mobile fundus lenses, capture high-res scans, and obtain instant diagnostic reports.</p>
      <b>Features:</b> Offline caching • Real-time camera alignment guidance
    </td>
  </tr>
  <tr>
    <td width="50%" valign="top">
      <h3>☁️ AWS Cloud Pipeline</h3>
      <p>Scans are encrypted and uploaded to <b>Amazon S3</b>, triggering automated Lambda image normalizers and routing to <b>Amazon SageMaker</b> GPU endpoints.</p>
      <b>Features:</b> Sub-2 second classification • Cognito patient auth
    </td>
    <td width="50%" valign="top">
      <h3>🔍 TruLens Metric Evaluation</h3>
      <p>Rigorous model evaluation pipeline measuring diagnostic precision, sensitivity (recall), specificity, and hallucination bounds across multi-modal diagnostic text generation.</p>
      <b>Features:</b> Continuous drift monitoring • Clinical validation logs
    </td>
  </tr>
</table>

---

## ⚡ Quickstart

```bash
# Clone repository
git clone https://github.com/prak05/RetinaScan-Diagnostic-AI.git
cd RetinaScan-Diagnostic-AI

# Start API server
npm install && npm run dev
```

---

<div align="center">
<sub>Preserved Baseline: <a href="https://github.com/prak05/RetinaScan-Diagnostic-AI/tree/Ex">branch Ex</a> • Engineered for Scalable Production Clouds</sub>
</div>
