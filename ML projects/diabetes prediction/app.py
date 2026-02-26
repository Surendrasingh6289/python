import numpy as np
import pandas as pd
import joblib 
import pickle
import streamlit as st


def main():
    st.title("Diabetes Prediction")
    st.header("Machine Learning project",divider='red')

    model = pickle.load("LogisticModel.sav")


    Pregnancy = st.number_input("Pregnancies",min_value=0,max_value=17)
    Glucose = st.number_input('Glucose',min_value=0,max_value=200)
    BloodPressure =st.number_input("BloodPressure",min_value=0,max_value=125)
    SkinThickness = st.number_input("SkinThickness",min_value=0,max_value=100)
    Insulin = st.number_input("Insulin",min_value=0,max_value=850)
    BMI = st.number_input("BMI",min_value=0.0,max_value=67.0)
    DiabetesPedigreeFunction =st.number_input("DiabetesPedigreeFunction",min_value=0.0,max_value=3.0)
    Age = st.number_input("Age",min_value=21,max_value=81)

    if st.button("Predict"):
        new_array = np.array([[Pregnancy,Glucose,BloodPressure,SkinThickness,Insulin,BMI,DiabetesPedigreeFunction,Age]])
        prediction = model.predict(new_array)

        if prediction == 0:
            st.success("Negative")
        else:
            st.success("Positive")

if __name__ == "__main__":
    main()
