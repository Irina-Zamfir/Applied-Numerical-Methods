# Applied-Numerical-Methods

A collection of three MATLAB projects implementing core numerical and machine learning algorithms:

- Maze Solver using Markov Processes and iterative methods.
- Linear Regression with Gradient Descent and regularization.
- Neural Network for digit classification on MNIST.

Technologies: MATLAB, Machine Learning, Numerical Methods

## Project 1: Markov Models for Maze Solving
Description:
  This project implements a probabilistic pathfinding algorithm to navigate a maze. The maze is modeled as a Markov Decision Process (MDP), where each cell is a state. The goal is to find the shortest path to an exit while avoiding traps. The solution involves building state transition matrices and using the Jacobi iterative method to calculate success probabilities for each state, which are then used by a greedy heuristic to determine the optimal path.

Key Concepts & Technologies: Markov Decision Processes, Probability Theory, Jacobi Iterative Method, Sparse Matrices, Pathfinding.

## Project 2: Linear Regression with Regularization
Description:
  This project developes a fundamental supervised learning algorithm: Linear Regression. It explores different methods for optimizing the model's parameters, including Gradient Descent and the Conjugate Gradient method for the Normal Equation. The project also extends the basic model by implementing two regularization techniques, Lasso (L1) and Ridge (L2) regression, to prevent overfitting and improve model generalization.

Key Concepts & Technologies: Supervised Learning, Linear Regression, Gradient Descent, Normal Equation, L1/L2 Regularization, Machine Learning.

## Project 3: MNIST Classification
Description:
  This project involves building a simple neural network from scratch to classify handwritten digits from the MNIST dataset. The implementation includes forward propagation for making predictions and backpropagation for training the network by minimizing a regularized cost function. The core tasks cover data loading, parameter initialization, and evaluating the model's performance on a test set.

Key Concepts & Technologies: Neural Networks, Multi-class Classification, Forward Propagation, Backpropagation, Sigmoid Activation, MNIST Dataset.
