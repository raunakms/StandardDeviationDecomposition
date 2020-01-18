# StandardDeviationDecomposition
This script is useful for Standard Deviation Decomposition implemented in R.
<br/><br/>

## Usage
- Standard Deviation Decomposition
  - Use `getStdDev.Decomposition()` function to get the within group (in-class), between group (out-class) standard deviation.
  - See `run_demo_script.R` for details.

```sh
getStdDev.Decomposition(dat)
```
#### Input parameter
- `dat` : R dataframe containing the input data of Group and Observation. See File Format for details.

#### Output
- The function `getStdDev.Decomposition` generates output of the following in form of a R-list.
  - `Standard_Deviation_Between_Groups` : Between group Standard Deviation 
  - `Standard_Deviation_Within_Groups`  : Within group Standard Deviation
<br/><br/>


## File Format
- A tab separated file with two columns.
- The first column with header `Group`. This column includes group labels.
- The second column with header `Observation`. This column contains numeric values indicating individual observation. These values may or may not be in a sorted order.
- See `dummy_observations.tsv` for details. 

```sh
Group   Observation
A       2
A       6
B       10
C       18
B       20
A       25
C       30
C       50
C       55
B       84
```
