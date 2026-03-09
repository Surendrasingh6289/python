import numpy as np
import pandas as pd
import streamlit as st
import joblib

model = joblib.load('dtc_model.pkl')
encoder = joblib.load('encoder.pkl')
y = joblib.load('y.pkl')

st.title('CUSTOMER CHURN PREDICTION')

Age = st.number_input("Age",min_value=18,max_value=80)
Balance = st.number_input("Balance")
Duration = st.number_input("Duration",min_value=0,max_value=4500)
Campaign = st.number_input("Campaign",min_value=1,max_value=65)
pdays = st.number_input("pdays",min_value=-1,max_value=900)
day_of_week = st.number_input("day_of_week",min_value=1,max_value=31)
previous = st.number_input("previous",)

housing = st.selectbox('housing',encoder['housing'].classes_)
loan = st.selectbox('loan',encoder['loan'].classes_)
month = st.selectbox('month',encoder['month'].classes_)
default = st.selectbox('default',encoder['default'].classes_)
education = st.selectbox('education',encoder['education'].classes_)
marital = st.selectbox('marital',encoder['marital'].classes_)
job = st.selectbox('job',encoder['job'].classes_)


housing_enc = encoder['housing'].transform([housing])[0]
loan_enc = encoder['loan'].transform([loan])[0]
month_enc = encoder['month'].transform([month])[0]
default_enc =encoder['default'].transform([default])[0]
education_enc = encoder['education'].transform([education])[0]
marital_enc = encoder['marital'].transform([marital])[0]
job_enc = encoder['job'].transform([job])[0]


if st.button("Predict"):

    new_array = np.array([[Age,Balance,Duration,Campaign,pdays,day_of_week,
                            housing_enc,loan_enc,month_enc,default_enc,
                            education_enc,marital_enc,job_enc]])

    prediction = model.predict(new_array)

    if prediction[0] == 1:
        st.success("positive")
    else:
        st.success("negative")