# Beyond the Spreadsheet: A Shiny Simulator Starter
**KS&R Decision Sciences & Innovation (DS&I) | Quant UX 2026**

---

## Overview

This repository accompanies KS&R's Quant UX 2026 talk: *Beyond the Spreadsheet: Modernizing Conjoint Simulators Using a Shiny Toolkit.*

In the talk, we argue that a conjoint simulator should be treated as a user-facing research product, not just an analytic output. This repo provides a minimal shiny framework as a starting point: a basic Shiny app that shows how user inputs flow into a scenario, a validation step, and a results table.

This repo and app are for education purposes only and are intended to illustrate the basic framework of a very simple Shiny app in R. The app in this repo runs out of the box, but the included placeholder functions are for illustration purposes only and generate random numbers in the output table. 

---

## Repository Structure

```
quant_ux_2026_shiny_simulator_starter/
│
├── app.R          # The complete Shiny app (UI, server, placeholder functions)
├── slides/        # Talk slides (PDF added after the conference)
├── renv.lock      # Reproducible R environment
├── LICENSE        # MIT License
└── README.md
```

---

## Technical Requirements

**Core Dependencies:**
- **R** 4.6.0 (version recorded in `renv.lock`; recent earlier versions should also work)
- **RStudio** or **Positron** (optional)

**Key R Packages:**
- `shiny` - Web application framework for R
- `bslib` - Bootstrap 5 layouts and components

**Environment Setup:**

Package versions are managed with [renv](https://rstudio.github.io/renv/), which records the exact versions used to build this app in `renv.lock`. renv is an R package itself, so install it first, then run `renv::restore()` to install the recorded versions of `shiny`, `bslib`, and their dependencies.

```r
# Install renv (one time), then restore the package environment
install.packages("renv")
renv::restore()

# Or install the two packages directly
install.packages(c("shiny", "bslib"))
```

---

## Quick Start

1. **Clone the repository**
   ```
   git clone https://github.com/ksrinc/quant_ux_conf_2026_conjoint_simulators_in_shiny.git
   ```
2. **Open the folder** in RStudio or Positron and install packages (see above)
3. **Run the app**
   ```r
   shiny::runApp()
   ```

Change the flavor or price and the *Scenario* table updates. The *Simulated results* box shows a placeholder message until you replace the placeholder functions with your own.

---

## How It Works

`app.R` has three parts:

| Part | What it does |
|---|---|
| Placeholder functions | `custom_validation_function()` (returns `NULL`) and `custom_calculation_function()` (returns randomly generated numbers as placeholders for share of preference (SOP)) |
| UI | A sidebar with two inputs (`selectInput()`, `numericInput()`) and two side-by-side cards for output tables |
| Server | Combines the inputs into a `scenario` data frame, displays it, then validates it and calculates results |

The results output uses `validate(need())`: if `custom_validation_function()` returns a message, Shiny shows that message in place of the results.

The purpose of this code is to illustrate the basic framework of a shiny simulator app

---

## Learn More

- Shiny: https://shiny.posit.co/r/getstarted/
- bslib: https://rstudio.github.io/bslib/
- Input validation in Shiny: https://shiny.posit.co/r/articles/improve/validation/

---

## Citation

Burton, C., & Pierce, A. (2026). *Beyond the Spreadsheet: Modernizing Conjoint Simulators Using a Shiny Toolkit.*
Presented at **Quant UX 2026**, KS&R Decision Sciences & Innovation.

---

## License

This project is licensed under the [MIT License](./LICENSE).

---

## Contact & Support

**Presenters:**
- **Connor Burton**, KS&R Decision Sciences & Innovation
  [cburton@ksrinc.com](mailto:cburton@ksrinc.com)
- **Allie Pierce, PhD**, KS&R Decision Sciences & Innovation
  [apierce@ksrinc.com](mailto:apierce@ksrinc.com)

For questions about:
- **Talk content**: Contact either presenter
- **Custom implementations**: Available for consulting engagements
- **Technical support**: GitHub issues welcome

---
