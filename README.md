# Blood Vessel Segmentation for Retinal Disease Detection

This project aims to segment blood vessels in retinal images, a critical step in the early detection and treatment of retinal diseases. The segmentation of blood vessels plays a pivotal role in diagnosing diseases like diabetic retinopathy and glaucoma. The approach used in this project enhances retinal image analysis by applying various image preprocessing and segmentation techniques. The results are validated using ground truth images to assess performance metrics such as accuracy, sensitivity, recall, precision, and F1 score.

## Approach

The method is composed of several stages, ensuring robust blood vessel segmentation in retinal images. These steps are as follows:

### 1. Input Image Conversion
- The process begins by converting input retinal images (typically in color) to grayscale. Grayscale conversion simplifies the image and prepares it for further enhancement techniques.

### 2. Contrast Limited Adaptive Histogram Equalization (CLAHE)
- **CLAHE** is applied to enhance the contrast of the grayscale images, making the blood vessels more visible. This step is crucial in improving the quality of the input images before proceeding to the next stage of segmentation.

### 3. Preprocessing
- **Average Filter for Background Removal**: An average filter is applied to remove the background and noise from the image. This helps isolate the blood vessels and enhances their visibility for the next steps in the process.
- **Inpainting Technique**: The inpainting technique is used to completely eliminate the background while preserving the blood vessels. This ensures that only the blood vessels remain as the focus of the image, which is critical for segmentation accuracy.

### 4. Blood Vessel Segmentation
- The final output consists of the segmented blood vessels, which are extracted from the preprocessed images. The segmentation process isolates these vessels, providing a clear and accurate representation for further analysis.

### 5. Performance Evaluation
- The proposed method is validated using ground truth data. The evaluation compares the segmented results with the ground truth images to calculate key performance metrics such as accuracy, sensitivity, recall, and precision.
  
## Performance Metrics

The performance of the proposed segmentation method is validated using various metrics. Below are the key performance metrics obtained from the results:

| Metric       | Value      |
|--------------|------------|
| Accuracy     | 85%        |
| Sensitivity  | 83%        |
| Specificity  | 88%        |
| Precision    | 84%        |
| F1 Score     | 83.5%      |

These metrics indicate that the proposed method performs well in segmenting blood vessels, making it a valuable tool for medical image analysis, particularly in the detection of retinal diseases.

## Results

**Segmented Blood Vessel Image**:

The following image illustrates the results of the blood vessel segmentation. The vessels are highlighted after applying the preprocessing and segmentation techniques:

![Segmented Image](https://github.com/user-attachments/assets/b53b736b-2e17-4c6c-916d-7b3d55ea92ac)

This image showcases how effectively the method isolates the blood vessels from the rest of the retinal image, making it easier to diagnose potential issues.

## System Architecture

The architecture of the system consists of the following stages:

### 1. Image Preprocessing
- **Grayscale Conversion**: The input color images are converted to grayscale to simplify the segmentation task.
- **CLAHE**: Applied to improve the visibility of vessels by enhancing the image contrast.
- **Noise Removal & Background Isolation**: Background and noise are removed using an average filter and the inpainting technique, ensuring that the focus remains on the blood vessels.

### 2. Blood Vessel Segmentation
- The blood vessels are extracted from the preprocessed images. This step is crucial for identifying vascular abnormalities and aiding disease detection.

### 3. Post-Processing
- Refining the segmented blood vessels to ensure a clean and clear output.

### 4. Performance Evaluation
- The results are evaluated against ground truth images to calculate performance metrics such as accuracy, sensitivity, specificity, precision, and F1 score.

## Installation

### Prerequisites

Before running this project, ensure that you have the following:

- **MATLAB**: Required for running the image processing scripts.
- **MATLAB Image Processing Toolbox**: Necessary for functions used in preprocessing and segmentation.
- **MATLAB Statistics and Machine Learning Toolbox**: Required for performance evaluation.

### Steps for Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/blood-vessel-segmentation.git
    ```
   
2. Install the required MATLAB toolboxes:
    - Image Processing Toolbox
    - Statistics and Machine Learning Toolbox

3. Download the dataset for retinal images and ground truth annotations. You can replace the paths in the code with your local paths to the datasets.

## Usage

### Step 1: Data Preparation
- Ensure that your retinal images and ground truth annotations are properly organized and accessible. The images should be in a format compatible with MATLAB (e.g., .png, .jpg, .bmp).
- Create directories for your training and testing images, as well as the corresponding ground truth annotations.

### Step 2: Run the Preprocessing Script
- Execute the preprocessing script in MATLAB to:
  1. Convert the images to grayscale.
  2. Apply CLAHE.
  3. Remove the background using an average filter and the inpainting technique.

### Step 3: Segmentation
- Once preprocessing is complete, run the segmentation script to extract the blood vessels. The script will produce segmented images.

### Step 4: Performance Evaluation
- Use the evaluation script to compare the segmented images with the ground truth data. This will calculate and display the performance metrics like accuracy, sensitivity, specificity, precision, and F1 score.

## Conclusion

This project demonstrates an effective approach for segmenting blood vessels in retinal images, crucial for diagnosing retinal diseases. The method achieved high performance in detecting and segmenting blood vessels, providing an efficient and scalable solution for medical image analysis. The promising results highlight the potential of this technique for real-world applications in ophthalmology.

### Future Work
- **Algorithm Optimization**: Explore more advanced segmentation techniques to improve performance further.
- **Integration with Disease Diagnosis**: Extend the system to not only segment blood vessels but also diagnose diseases based on vascular abnormalities.
- **Real-time Analysis**: Develop real-time processing pipelines for the integration of this system in clinical environments.

## Acknowledgments

- The dataset used for this project is publicly available and can be found at [Dataset Source Link].
- Special thanks to the research community for their contributions to retinal disease analysis and image processing techniques that helped shape this project.
