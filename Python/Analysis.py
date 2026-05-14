import pandas as pd

# Load cleaned dataset
df = pd.read_excel(
    "Data/Cleaned/cleaned_healthcare_dataset.xlsx"
)

# Show first 5 rows
print(df)

# -------------------------------
# BASIC BUSINESS KPIs
# -------------------------------

# Total patients
total_patients = df.shape[0]

# Total revenue
total_revenue = df["Billing Amount"].sum()

# Average billing amount
average_bill = df["Billing Amount"].mean()

# Average stay duration
average_stay = df["Stay Duration"].mean()

print("Total Patients:", total_patients)

print("Total Revenue:", total_revenue)

print("Average Billing Amount:", average_bill)

print("Average Stay Duration:", average_stay)

# -------------------------------
# TOP HOSPITALS BY REVENUE
# -------------------------------

hospital_revenue = (
    df.groupby("Hospital")["Billing Amount"]
    .sum()
    .sort_values(ascending=False)
)

print("\nTop Hospitals By Revenue\n")

print(hospital_revenue.head(10))

# -------------------------------
# MOST COMMON MEDICAL CONDITIONS
# -------------------------------

medical_conditions = (
    df["Medical Condition"]
    .value_counts()
)

print("\nMost Common Medical Conditions\n")

print(medical_conditions)

# -------------------------------
# GENDER ANALYSIS
# -------------------------------

gender_analysis = (
    df.groupby("Gender")["Billing Amount"]
    .mean()
)

print("\nAverage Billing Amount By Gender\n")

print(gender_analysis)

# -------------------------------
# INSURANCE PROVIDER ANALYSIS
# -------------------------------

insurance_analysis = (
    df["Insurance Provider"]
    .value_counts()
)

print("\nInsurance Provider Analysis\n")

print(insurance_analysis)

# -------------------------------
# ADMISSION TYPE ANALYSIS
# -------------------------------

admission_analysis = (
    df["Admission Type"]
    .value_counts()
)

print("\nAdmission Type Analysis\n")

print(admission_analysis)