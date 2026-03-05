import numpy as np
import streamlit as st
import pandas as pd
import pickle


def main():
    st.header("Titanic Survival Prediction",text_alignment='center',divider='rainbow')
    st.subheader("Using Machine Learning",text_alignment='center',divider='rainbow')


    with open("SurvivalPrediction.pkl",'rb') as file:
        model = pickle.load(file)
    
    Pclass = st.number_input("Pclass",min_value=1,max_value=3)
    Sex = st.number_input("Sex",min_value=0,max_value=1)
    Age = st.number_input("Age",min_value=0.0,max_value=80.0)
    SibSp = st.number_input("SibSp",min_value=0,max_value=8)
    Parch = st.number_input("Parch",min_value=0,max_value=6)
    Embarked = st.number_input("Embarked",min_value=1,max_value=3)

    if st.button("Predict"):
        new_array = np.array([[Pclass, Sex, Age, SibSp, Parch, Embarked]])
        prediction = model.predict(new_array)

        if prediction[0] == 0:
            st.success("Not Survival")
        else:
            st.success("Survived")
    

if __name__ =="__main__":
    main()