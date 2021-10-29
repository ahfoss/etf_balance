#library(quantmod)

#' labels: char vector of length k; stock names
#' proportions: numeric vector of length k that sums to 1
#' prices: numeric vector of length k; stock prices
#' budget: double; total budget
greedy_balance <- function(
  labels,
  proportions,
  prices,
  budget
) {
  if (length(labels) != length(proportions)
    || length(labels) != length(prices)) {
    stop('Input vector lengths must match.')
  }
  if (abs(sum(proportions) - 1) > 0.001) {
    stop('Input proportions vector must sum to 1.')
  }
  # Sort everything
  sorted_inds <- order(prices, decreasing = TRUE)
  sorted_props <- proportions[sorted_inds]
  target_spending <- budget * sorted_props
  sorted_labs <- labels[sorted_inds]
  sorted_prices <- prices[sorted_inds]

  current_count <- target_spending %/% sorted_prices
  current_spending <- current_count * sorted_prices
  min_ind <- i <- 1
  while(min_ind < length(labels)) {
    proposed_count <- current_count
    proposed_count[i] <- current_count[i] + 1
    proposed_spending <- proposed_count * sorted_prices
    if (sum(proposed_spending) <= budget) {
      current_count <- proposed_count
      current_spending <- proposed_spending
    } else {
      min_ind <- i + 1
    }
    i <- i + 1
    if (i > length(labels)) {
      i <- min_ind
    }
  }
  return(data.frame(
    label = sorted_labs,
    prices = sorted_prices,
    count = current_count,
    spending = current_spending,
    target.prop = sorted_props,
    actual.prop = current_spending / sum(current_spending)
  ))
}
