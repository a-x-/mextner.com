---
title: "X-Bank: High-Load Scalping Order Book Development"
date: 2024-07-09
translationKey: "case_xbank"
---

## The Challenge

As part of a consulting project for X-Bank, we were tasked with designing and developing a high-performance trading terminal—a scalping order book—from scratch. The key requirements were the ability to withstand extreme loads, present information in the most intuitive and dynamic way possible, and ensure instantaneous interface response.

## My Role

**My Role:** Hands-on development, architecture design, client presentations, technical leadership.

## The Solution

The architecture was proposed and implemented on Canvas and Solid.js. The layout is based on four draggable panels. The scalping terminal allows the trader to quickly place orders and monitor the market.

<img width="100%" src="/images/cases/scalp-xbank-2025.jpeg" alt="Scalping order book interface" />

* **Trades Feed and Clusters:** Visualization of order flow and aggregated volumes at different price levels.
* **Interactive Order Book:** Dynamic display of limit orders with one-click trading capabilities.
* **Price Chart:** A classic chart enriched with data from the order book.
* **Control Panel:** Management of orders, positions, and risks.

The interface was designed with a focus on maximum information density and speed, allowing traders to make decisions in fractions of a second. In our opinion, the resulting product is the best in its field.

## Technology Stack

* **Canvas API:** Used for rendering the charts and the order book, ensuring maximum performance.
* **Solid.js:** A reactive framework for creating high-performance and responsive user interfaces.
* **D3.js:** A library for complex data manipulation and visualization.
