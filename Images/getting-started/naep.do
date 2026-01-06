import delimited "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\17yo-math-naep.csv"
save "C:\Users\favero\Downloads\naep.dta"
import delimited "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\spending.csv", clear 
merge 1:1 year using "C:\Users\favero\Downloads\naep.dta"
drop _merge

keep if year >= 1973 & year <= 2012
la var spending "Spending per Pupil"
la var score "Math Proficiency"
destring spending, replace ignore(",")
twoway (line spending year, yaxis(1)) (connected score year, yaxis(2)), scheme(s1mono) ytitle(Expenditures in 2022-23 dollars, axis(1)) ytitle(17-year-old long-term trend NAEP scores, axis(2)) yla(, format(%12.0fc))
graph export "C:\Users\favero\OneDrive - american.edu\Documents\GitHub\stats-pub-affairs\Images\getting-started\naep.png", replace
