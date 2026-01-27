<div align="center">

# Snakes and Ladders Optimal Strategy

*Finding Optimal Dice Selection using MDP and Q-Learning*

![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)
![NumPy](https://img.shields.io/badge/NumPy-1.21+-orange.svg)
![License](https://img.shields.io/badge/License-Academic-green.svg)

[About](#about) • [Game Rules](#game-rules) • [Algorithms](#algorithms) • [Usage](#usage) • [Results](#results) • [Structure](#repository-structure)

</div>

---

## About

This project analyzes a stochastic version of **Snakes and Ladders** using **Markov Decision Processes (MDP)** and **Reinforcement Learning (Q-Learning)**. The objective is to determine the optimal dice selection strategy to minimize the expected number of moves to reach the final square.

### Core Insight

```
Optimal Strategy = argmin E[moves to goal | dice choice at each position]
```

Two approaches are compared:
- **MDP**: Model-based value iteration with known transition probabilities
- **Q-Learning**: Model-free learning through game simulation

---

## Game Rules

### Board Configuration

The game board consists of **15 positions** (0-14), where position 14 is the goal.

### Dice Types

| Die | Moves | Probability | Triggers Effect |
|-----|-------|-------------|-----------------|
| **Security** | 0 or 1 | 50% each | Never (immune) |
| **Normal** | 0, 1, or 2 | 33% each | 50% chance |
| **Risky** | 0, 1, 2, or 3 | 25% each | Always |

### Cell Effects

| Effect | Description |
|--------|-------------|
| **Restart** | Return to position 0 |
| **Penalty** | Move back 3 positions |
| **Prison** | Skip next turn |
| **Bonus** | Play again immediately |

### Game Variants

- **Exact End**: Must land exactly on position 14
- **Flexible End**: Reaching or surpassing position 14 wins

---

## Algorithms

### Markov Decision Process (MDP)

Value iteration algorithm that computes the optimal policy by iteratively updating state values:

```
V(s) = min_a [ 1 + Σ P(s'|s,a) × V(s') ]
```

**Parameters:**
- Max iterations
- Convergence tolerance

### Q-Learning

Model-free reinforcement learning with epsilon-greedy exploration:

```
Q(s,a) ← Q(s,a) + α × [r + γ × max_a' Q(s',a') - Q(s,a)]
```

**Parameters:**
- Learning rate (α)
- Discount factor (γ)
- Exploration rate (ε) with exponential decay
- Episodes

---

## Usage

### Prerequisites

- Python 3.8+
- pip

### Installation

```bash
# Clone the repository
git clone https://github.com/mathisdelsart/SnakesLadders-MDP.git
cd SnakesLadders-MDP

# Install dependencies
make install

# Or create a virtual environment
make venv
source venv/bin/activate
```

### Running

```bash
# Run main demonstration
make run

# Run full simulation comparing all strategies
make run-simulate

# Generate analysis plots
make run-analysis
```

---

## Results

Results are saved in the `results/` directory:

```
results/
├── csv/              # Simulation data
│   ├── simulations_layout_*.csv
│   └── time-memory.csv
└── figures/          # Visualization plots
    └── Layout_all_*.pdf
```

### Evaluated Strategies

| Strategy | Description |
|----------|-------------|
| Optimal MDP | Computed via value iteration |
| Optimal Q-Learning | Learned via reinforcement learning |
| Always Security | Always use security die |
| Always Normal | Always use normal die |
| Always Risky | Always use risky die |
| Random | Random dice selection |

---

## Repository Structure

```
snakes-ladders-mdp/
├── algorithms/                 # Decision algorithms
│   ├── MarkovDecision.py       # MDP value iteration
│   ├── QLearningDecision.py    # Q-Learning implementation
│   └── QLearningExperiment.py  # Q-Learning with visualization
├── game/                       # Game mechanics
│   ├── BoardGame.py            # Main board class
│   ├── Die.py                  # Dice implementation
│   ├── State.py                # State representation
│   ├── TransitionManager.py    # Transition probabilities
│   └── Enum.py                 # DieType and CellType enums
├── simulator/                  # Simulation tools
│   ├── BoardGameSimulator.py   # Simulation runner
│   └── DiceStrategy.py         # Strategy implementations
├── plotter/                    # Visualization
│   ├── strategy_analysis.py    # Strategy comparison plots
│   └── memory_analysis.py      # Memory profiling
├── results/                    # Output data
│   ├── csv/                    # CSV results
│   └── figures/                # PDF plots
├── main.py                     # Main entry point
├── simulate.py                 # Full simulation script
├── Makefile                    # Build automation
├── requirements.txt            # Dependencies
└── README.md
```

---

## Academic Context

This project was developed as part of the **LINFO2275 - Data Mining and Decision Making** course at **UCLouvain**.

### Authors

- Mathis Delsart
- Cyril Bousmar
- Sienou Lamien
