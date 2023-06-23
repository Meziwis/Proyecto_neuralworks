# Flight Data 

This directory contains the flight data used for the analysis and modeling in the project. Here is the tree structure of the data folder:

```bash
├── dataset_SCL.csv
├── README.md
├── synthetic_features.csv
├── X_test_balanceado.csv
├── X_test_desbalanceado.csv
├── X_train_balanceado.csv
├── X_train_desbalanceado.csv
├── y_test_balanceado.csv
├── y_test_desbalanceado.csv
├── y_train_balanceado.csv
└── y_train_desbalanceado.csv
```


## Dataset Information

The main dataset used in this project is `dataset_SCL.csv`. It contains flight data passing through Santiago, Chile. Here is the basic information about the columns in the dataset:

1. Fecha-I: Scheduled date and time of the flight.
2. Vlo-I: Scheduled flight number.
3. Ori-I: Scheduled origin city code.
4. Des-I: Scheduled destination city code.
5. Emp-I: Scheduled airline code.
6. Fecha-O: Operation date and time of the flight.
7. Vlo-O: Operated flight number.
8. Ori-O: Origin city code of the operation.
9. Des-O: Destination city code of the operation.
10. Emp-O: Airline code of the operated flight.
11. DIA: Day of the month of the flight operation.
12. MES: Month number of the flight operation.
13. AÑO: Year of the flight operation.
14. DIANOM: Day of the week of the flight operation.
15. TIPOVUELO: Flight type, where "I" stands for International and "N" stands for National.
16. OPERA: Name of the operating airline.
17. SIGLAORI: Origin city name.
18. SIGLADES: Destination city name.

## Additional Files

- `synthetic_features.csv`: Contains synthetic features generated for the analysis.
- `X_train_balanceado.csv`: Training set features for the balanced dataset.
- `X_train_desbalanceado.csv`: Training set features for the unbalanced dataset.
- `X_test_balanceado.csv`: Test set features for the balanced dataset.
- `X_test_desbalanceado.csv`: Test set features for the unbalanced dataset.
- `y_train_balanceado.csv`: Training set labels for the balanced dataset.
- `y_train_desbalanceado.csv`: Training set labels for the unbalanced dataset.
- `y_test_balanceado.csv`: Test set labels for the balanced dataset.
- `y_test_desbalanceado.csv`: Test set labels for the unbalanced dataset.

Please refer to the specific notebook or script documentation for more details on the usage and purpose of these files.





