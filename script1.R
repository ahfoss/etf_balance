source('fun.R')

# 3-fund portfolio
tickers <- c(
  'SCHB', # US Broad Market ETF
  'SCHF', # International Equity Index ETF
  'SCHZ'  # US Aggregate Bond Index ETF
)
proportions <- c(
  .7, .2, .1
)
prices <- c(
  110.69,
  40.22,
  54.18
)
greedy_balance(
  tickers, proportions, prices, budget = 5000
)

# Randy Kurtz more diversified
k_tickers <- c(
  'BWX',   # SPDR Bloomberg Barclays Intl Treasury Bond
  'EMLC',  # VanEck Vectors JP Morgan Emer Mkts Loc Curr Bond
  'BND',   # Vanguard Total Bond Market
  'IAU',   # iShares Gold Trust
  'DBC',   # PowerShares DB Commodity Tracking
  'VEU',   # Vanguard FTSE All-World ex-US
  'VWO',   # Vanguard FTSE Emerging Markets Index
  'VNQI',  # VAnguard Global ex-US Real Estate
  'VNQ',   # Vanguard REIT
  'VTI'    # VAnguard Total Stock Market
)

k_proportions <- c(
  .13, .10, .09, .11,
  .05, .17, .14, .04,
  .06, .11
)
# Higher total stock market (VTI)
prop_vti <- 0.5
non_vti <- k_proportions[1:9]
non_vti <- (non_vti / sum(non_vti)) * (1 - prop_vti)
my_proportions <- c(non_vti, prop_vti)

k_prices <- c(
  28.71,
  29.55,
  85.36,
  34.22,
  21.46,
  63.18,
  51.30,
  58.10,
  110.28,
  236.60
)
greedy_balance(
  k_tickers, my_proportions, k_prices, budget = 5000
)
