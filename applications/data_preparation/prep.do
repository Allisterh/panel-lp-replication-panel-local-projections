* ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
* Data Preparation
* This do file demonstrates the step-by-step process of preparing the .csv 
* dataset for the subsequent applications.
* ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

* Set the working directory if necessary
global mainph="D:/GitHub/panel-lp-replication/applications"
global codeph "${mainph}/data_preparation"
cd "$codeph"





**# ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
**# 1. Romer and Romer (2017)
* 	Target outputs:
* 	  - applications\empirical_RR_f4_lngdp_1980.csv
* 	  - applications\empirical_RR_f4_lnunemp_1980.csv
**  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

* Step 1
* ======================================
* Download the replication package from:
*   http://doi.org/10.3886/E113046V1

* Within the downloaded replication package, locate:
*   113046-V1\20150320_data\Data-and-Programs\JORDA.RAT
*
* Execute the code from line 1 to line 84. This will create the required
* intermediate dataset. Export that dataset as:
*   applications\data_preparation\RR_f4data.xlsx


* Step 2
* ======================================
* Import RR_f4data.xlsx into Stata, prepare dataset and export

* Import data
import excel "RR_f4data.xlsx", sheet("f4data") firstrow clear

* Individual index, time index and sample restriction
gen COUNTDUMS = .
forvalues i = 1/23 {
    replace COUNTDUMS = `i' if COUNTDUMS_MIN1`i' == 1
}
// If no dummy is 1, set to 24
replace COUNTDUMS = 24 if missing(COUNTDUMS)

keep if FULLSAMP == 1

egen halfyear = group(A)

keep COUNTDUMS halfyear LNGDP UNEMP CRISIS
order COUNTDUMS halfyear LNGDP UNEMP CRISIS

* Generate leads and lags
xtset COUNTDUMS halfyear
// Leads
forvalues i = 1/10 {
    gen f`i'LNGDP = f`i'.LNGDP
    gen f`i'UNEMP = f`i'.UNEMP
}
// Lags
forvalues i = 1/4 {
    gen l`i'CRISIS = l`i'.CRISIS
    gen l`i'LNGDP  = l`i'.LNGDP
    gen l`i'UNEMP  = l`i'.UNEMP
}
rename LNGDP f0LNGDP
rename UNEMP f0UNEMP

* Year >= 1980
drop if halfyear < 41

* Save cleaned dataset
order COUNTDUMS halfyear ///
      f0LNGDP  f1LNGDP  f2LNGDP  f3LNGDP  f4LNGDP  f5LNGDP  f6LNGDP  f7LNGDP  f8LNGDP  f9LNGDP  f10LNGDP ///
      f0UNEMP  f1UNEMP  f2UNEMP  f3UNEMP  f4UNEMP  f5UNEMP  f6UNEMP  f7UNEMP  f8UNEMP  f9UNEMP  f10UNEMP ///
      CRISIS ///
	  l1LNGDP  l2LNGDP  l3LNGDP  l4LNGDP ///
      l1UNEMP  l2UNEMP  l3UNEMP  l4UNEMP ///
	  l1CRISIS l2CRISIS l3CRISIS l4CRISIS
save RR_f4data.dta, replace

* Export
use RR_f4data, replace
keep COUNTDUMS halfyear ///
     f0LNGDP  f1LNGDP  f2LNGDP  f3LNGDP  f4LNGDP  f5LNGDP  f6LNGDP  f7LNGDP  f8LNGDP  f9LNGDP  f10LNGDP ///
     CRISIS  ///
	 l1CRISIS l2CRISIS l3CRISIS l4CRISIS ///
	 l1LNGDP  l2LNGDP  l3LNGDP  l4LNGDP
export delimited using "$mainph\empirical_RR_f4_lngdp_1980.csv", replace

use RR_f4data, replace
keep COUNTDUMS halfyear ///
     f0UNEMP  f1UNEMP  f2UNEMP  f3UNEMP  f4UNEMP  f5UNEMP  f6UNEMP  f7UNEMP  f8UNEMP  f9UNEMP  f10UNEMP ///
     CRISIS ///
	 l1CRISIS l2CRISIS l3CRISIS l4CRISIS ///
	 l1UNEMP  l2UNEMP  l3UNEMP  l4UNEMP
export delimited using "$mainph\empirical_RR_f4_lnunemp_1980.csv", replace





**# ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
**# 2. Baron, Verner, and Xiong (2021)
* 	Target outputs:
* 	  - applications\empirical_BVX_t1_y.csv
**  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

* Step 1
* ======================================
* Download the replication package from:
*   https://drive.google.com/uc?export=download&id=1EagrX_Jq6Sri01IevZBh1GsfSpCWZiQ2

* Within the downloaded replication package, locate:
*   BVX replication kit\BVX_Final_Tables_Figures_Annual.do
*
* Execute the code from line 454 to line 485. This will create the required
* intermediate dataset. Save that dataset as:
*   applications\data_preparation\BVX_t1data.dta


* Step 2
* ======================================
* Use BVX_t1data.dta to prepare dataset and export

use BVX_t1data, clear

keep if smp==1
keep ccode year ///
      Fd1y Fd2y Fd3y Fd4y Fd5y Fd6y ///
      R_B R_N ///
      L1R_B L2R_B L3R_B ///
      L1R_N L2R_N L3R_N ///
      D1y L1D1y L2D1y L3D1y ///
      D1d_y L1D1d_y L2D1d_y L3D1d_y
order ccode year ///
      Fd1y Fd2y Fd3y Fd4y Fd5y Fd6y ///
      R_B R_N ///
      L1R_B L2R_B L3R_B ///
      L1R_N L2R_N L3R_N ///
      D1y L1D1y L2D1y L3D1y ///
      D1d_y L1D1d_y L2D1d_y L3D1d_y
export delimited using "$mainph\empirical_BVX_t1_y.csv", replace





**# ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
**# 3. Mian, Sufi, and Verner (2017)
* 	Target outputs:
* 	  - applications\empirical_MSV_f2.csv
**  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

* Step 1
* ======================================
* Download the replication package from:
*   https://faculty.chicagobooth.edu/-/media/faculty/amir-sufi/research/zip/msv_replicationkit_20170307.zip

* Within the downloaded replication package, locate:
*   MSV_ReplicationKit_20170307\Stata\MSV_TablesFigures_20170306.do
*
* Execute the code from line 1649 to line 1664. This will create the required
* intermediate dataset. Save that dataset as:
*   applications\data_preparation\MSV_f2data.dta


* Step 2
* ======================================
* Use MSV_f2data.dta to prepare dataset and export

use MSV_f2data, clear

keep if mainsmp1==1
keep CountryCode year ///
      F1y F2y F3y F4y F5y F6y F7y F8y F9y F10y ///
      L0HHD_L1GDP L0NFD_L1GDP ///
      L1HHD_L1GDP L2HHD_L1GDP L3HHD_L1GDP L4HHD_L1GDP ///
      L1NFD_L1GDP L2NFD_L1GDP L3NFD_L1GDP L4NFD_L1GDP ///
      L0y L1y L2y L3y L4y
order CountryCode year ///
      F1y F2y F3y F4y F5y F6y F7y F8y F9y F10y ///
      L0HHD_L1GDP L0NFD_L1GDP ///
      L1HHD_L1GDP L2HHD_L1GDP L3HHD_L1GDP L4HHD_L1GDP ///
      L1NFD_L1GDP L2NFD_L1GDP L3NFD_L1GDP L4NFD_L1GDP ///
      L0y L1y L2y L3y L4y
export delimited using "$mainph\empirical_MSV_f2.csv", replace





**# ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><
**# 4. Cerra and Saxena (2008)
* 	Target outputs:
* 	  - applications\empirical_CS_f3.csv
**  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><

* Step 1
* ======================================
* Download the replication package from:
*   http://doi.org/10.3886/E113234V1

* Within the downloaded replication package, locate:
*   113234-V1\20050666_data.xls


* Step 2
* ======================================
* Import 20050666_data.xls into Stata, prepare dataset and export

* Import sheets
tempfile grrt currcrisis
import excel "20050666_data.xls", sheet("grrt") firstrow clear
save `grrt', replace
import excel "20050666_data.xls", sheet("currcrisis") firstrow clear
save `currcrisis', replace
use `grrt', clear
merge 1:1 obs using `currcrisis', nogen

* Rename for reshape and panel setup
rename *_GRRT_WB GRRT_WB_*
rename *_CRISIS CRISIS_*

reshape long GRRT_WB CRISIS, i(obs) j(cnty) string

rename cnty country
encode country, gen(cnty)
drop country
order cnty obs
xtset cnty obs

* Generate leads and lags
// leads
foreach i in GRRT_WB {
	forv h=1/10 {
		gen f`h'`i'=f`h'.`i'
	}
}
// cumulative sum
forvalues h = 1/10 {
    gen cf`h'GRRT_WB = GRRT_WB
    forvalues k = 1/`h' {
        replace cf`h'GRRT_WB = cf`h'GRRT_WB + f`k'GRRT_WB
    }
}
// lags
foreach i in GRRT_WB CRISIS {
	forv lag=1/4 {
		gen l`lag'`i'=l`lag'.`i'
	}
}

* Save
save CS_f3data, replace

* Export
use CS_f3data, clear
sort obs cnty
bysort obs: gen cntyNUM = _n
order cntyNUM
sort cnty obs

keep cntyNUM obs ///
      cf1GRRT_WB  cf2GRRT_WB  cf3GRRT_WB  cf4GRRT_WB  cf5GRRT_WB ///
      cf6GRRT_WB  cf7GRRT_WB  cf8GRRT_WB  cf9GRRT_WB  cf10GRRT_WB ///
      CRISIS l1CRISIS l2CRISIS l3CRISIS l4CRISIS ///
      l1GRRT_WB l2GRRT_WB l3GRRT_WB l4GRRT_WB
order cntyNUM obs ///
      cf1GRRT_WB  cf2GRRT_WB  cf3GRRT_WB  cf4GRRT_WB  cf5GRRT_WB ///
      cf6GRRT_WB  cf7GRRT_WB  cf8GRRT_WB  cf9GRRT_WB  cf10GRRT_WB ///
      CRISIS l1CRISIS l2CRISIS l3CRISIS l4CRISIS ///
      l1GRRT_WB l2GRRT_WB l3GRRT_WB l4GRRT_WB
export delimited using "$mainph\empirical_CS_f3.csv", replace




