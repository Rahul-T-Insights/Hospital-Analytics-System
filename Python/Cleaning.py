import pandas as pd

# Load dataset
df = pd.read_csv(
    r"C:\Users\hp\Desktop\Projects\Hospital_Analytics_Project\Data\Raw\healthcare_dataset.csv"
)

# BASIC DATA INSPECTION

print(df.head())

print(df.shape)

print(df.columns)

print(df.dtypes)

print(df.isnull().sum())

# DATA CLEANING

# Remove duplicate rows
df = df.drop_duplicates()

# Text columns cleaning
text_columns = df.select_dtypes(include='object').columns

for col in text_columns:

    # Remove leading/trailing spaces
    df[col] = df[col].str.strip()

    # Convert text into Title Case
    df[col] = df[col].str.title()

# Convert dates into datetime
df["Date of Admission"] = pd.to_datetime(
    df["Date of Admission"]
)

df["Discharge Date"] = pd.to_datetime(
    df["Discharge Date"]
)

# Create new KPI column
df["Stay Duration"] = (
    df["Discharge Date"] - df["Date of Admission"]
).dt.days

# CHECK CLEANED DATA

print(df.head())
print(df.dtypes)
print(df["Stay Duration"].head())

# SAVE CLEANED DATASET

df.to_excel(
    r"Data/Cleaned/cleaned_healthcare_dataset.xlsx",
    index=False
)

print("Cleaned dataset saved successfully")