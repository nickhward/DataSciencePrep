//
//  Course.swift
//  DataSciencePrep
//
//  Created by Nick Ward on 6/6/23.
//

import SwiftUI

/// Book Model
///
///

struct CardContent: Hashable, Equatable {
    var title: String
    var description: String
}

struct Course: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var bookViews: Int
    var courseDescription: String
    var cardContent: [CardContent]
}

var courses: [String: [Course]] = [
    "Statistics": statisticsCourses,
    "Probability" : probabilityCourses,
    "Machine Learning" : machineLearningCourses,
    "Deep Learning" : deepLearningCourses,
    "SQL" : sqlCourses,
    "Python" : pythonCourses,
]

let statisticsCourses: [Course] = [
    .init(
        title: "Foundations",
        imageName: "statisticsfoundations",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Measures of Central Tendency", description: """
                
                • <bold>Mean:</bold> The average value of a data set, obtained by adding all numbers in the set and then dividing by the count of numbers.
                • <bold>Median:</bold> The middle value in a data set. For an odd number of observations, it is the middle number; for an even number of observations, it is the average of the two middle numbers.
                • <bold>Mode:</bold> The most frequently occurring value in a data set. A data set may have one mode (unimodal), more than one mode (multimodal), or no mode at all.
                """),
            CardContent(title: "Measures of Dispersion", description: """
                
                • <bold>Range:</bold> The difference between the highest and lowest values in a data set.
                • <bold>Variance:</bold> The average of the squared differences from the mean. It measures how far each number in the set is from the mean and thus from every other number in the set.
                • <bold>Standard Deviation:</bold> The square root of variance, providing a measure of dispersion in the same units as the original data.
                • <bold>Interquartile Range (IQR):</bold> The range between the first quartile (25th percentile) and the third quartile (75th percentile). It measures statistical dispersion, or how far apart the data points are spread.
                """),
            CardContent(title: "Sampling Techniques", description: """
                
                • <bold>Random Sampling:</bold> Each member of the population has an equal chance of being selected.
                • <bold>Stratified Sampling:</bold> The population is divided into subgroups (strata) based on specific characteristics, and samples are randomly selected from each stratum.
                • <bold>Cluster Sampling:</bold> The population is divided into groups (clusters), usually geographically, and a random sampling of clusters is selected.
                • <bold>Systematic Sampling:</bold> Every nth member of the population is selected.
                """),
            CardContent(title: "Types of Data", description: """
                
                • <bold>Categorical/Nominal:</bold> Data that can be sorted into categories but having no order or priority. Eg: Colors, Names.
                • <bold>Ordinal:</bold> Categorical data that has an explicit order. Eg: Ratings scale from 1 to 5.
                • <bold>Interval:</bold> Numerical data without a true zero point. Eg: Temperature in Celsius or Fahrenheit.
                • <bold>Ratio:</bold> Numerical data with a true zero point. Eg: Age, Height.
                """),
            CardContent(title: "Population vs Sample", description: """
                
                • <bold>Population:</bold> The entire group that you want to draw conclusions about.
                • <bold>Sample:</bold> A subset of the population that is used in your study. It is a slice of the population and needs to be representative for your conclusions to be valid for the population.
                """),
            
        ]
    ),
    .init(
        title: "Normal Distribution",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Concept of Normal Distribution", description: "Understanding the bell curve"),
            CardContent(title: "Z-score", description: "Standardizing values using Z-score"),
            CardContent(title: "Central Limit Theorem", description: "Understanding the importance of Central Limit Theorem in statistics")
        ]
    ),
    .init(
        title: "Confidence",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Confidence Intervals", description: "Interpreting and constructing confidence intervals."),
            CardContent(title: "Margin of Error", description: "Understand the concept of margin of error"),
            CardContent(title: "Significance Level", description: "The alpha level in hypothesis testing.")
        ]
    ),
    .init(
        title: "Type I and Type II Errors",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Type I and Type II errors:", description: "Differentiating false positive and false negative."),
            CardContent(title: "Power of a Test", description: "Understanding the probability of not making a Type II error."),
        ]
    ),
    .init(
        title: "Bayesian Statistics",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Bayesian Inference", description: "Updating the probability for a hypothesis as evidence or information becomes available."),
            CardContent(title: "Bayesian vs Frequentist Statistics", description: "The philosophical debate in statistics."),
        ]
    ),
]

var probabilityCourses: [Course] = [
    .init(
          title: "Bayes",
          imageName: "Book 1",
          author: "Rachael Lippincott",
          rating: 4,
          bookViews: 1023,
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Bayes Theorem", description: "Understanding the foundation of conditional probability."),
              CardContent(title: "Applications of Bayes", description: "How Bayes theorem is applied in real-world problems."),
          ]
      ),
    .init(
          title: "Theorems",
          imageName: "Book 2",
          author: "William B.Irvine",
          rating: 5,
          bookViews: 2049,
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Law of Large Numbers", description: "Understanding the theorem underpinning the stability of long-term outcomes."),
              CardContent(title: "Central Limit Theorem", description: "The importance of this theorem in statistical analysis."),
          ]
      ),
    .init(
          title: "Bayes",
          imageName: "Book 1",
          author: "Rachael Lippincott",
          rating: 4,
          bookViews: 1023,
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Bayes Theorem", description: "Understanding the foundation of conditional probability."),
              CardContent(title: "Applications of Bayes", description: "How Bayes theorem is applied in real-world problems."),
          ]
      ),
    .init(
          title: "Theorems",
          imageName: "Book 2",
          author: "William B.Irvine",
          rating: 5,
          bookViews: 2049,
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Law of Large Numbers", description: "Understanding the theorem underpinning the stability of long-term outcomes."),
              CardContent(title: "Central Limit Theorem", description: "The importance of this theorem in statistical analysis."),
          ]
      ),
]

var machineLearningCourses: [Course] = [
    .init(
        title: "Supervised ML",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Linear Regression", description: "The basics of linear predictive modeling."),
            CardContent(title: "Assumptions of Linear Regression", description: "What needs to be true for linear regression to be the right choice?"),
        ]
    ),
    .init(
        title: "Supervised ML",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Linear Regression", description: "The basics of linear predictive modeling."),
            CardContent(title: "Assumptions of Linear Regression", description: "What needs to be true for linear regression to be the right choice?"),
        ]
    ),
    .init(
        title: "Supervised ML",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Linear Regression", description: "The basics of linear predictive modeling."),
            CardContent(title: "Assumptions of Linear Regression", description: "What needs to be true for linear regression to be the right choice?"),
        ]
    ),
]

var deepLearningCourses: [Course] = [
    .init(
        title: "PyTorch",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to PyTorch", description: "Getting started with this deep learning framework."),
            CardContent(title: "Building Neural Networks with PyTorch", description: "Understanding the process of model creation in PyTorch."),
        ]
    ),
    .init(
        title: "Tensorflow",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to tensorflow", description: "Getting started with this deep learning framework."),
            CardContent(title: "Building Neural Networks with tensorflow", description: "Understanding the process of model creation in tensorflow."),
        ]
    ),
    .init(
        title: "PyTorch",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to PyTorch", description: "Getting started with this deep learning framework."),
            CardContent(title: "Building Neural Networks with PyTorch", description: "Understanding the process of model creation in PyTorch."),
        ]
    ),
]

var sqlCourses: [Course] = [
    .init(
        title: "Basic SQL",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to SQL", description: "Learn about SQL and its purposes."),
            CardContent(title: "SQL Queries", description: "Understand the basics of retrieving data using SQL queries."),
        ]
    ),
    .init(
        title: "Window Functions",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Window Functions", description: "Learn how window functions can be used for complex calculations."),
            CardContent(title: "Practical Examples of Window Functions", description: "See examples of window functions in action."),
        ]
    ),
    .init(
        title: "Examples",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to SQL", description: "Learn about SQL and its purposes."),
            CardContent(title: "SQL Queries", description: "Understand the basics of retrieving data using SQL queries."),
        ]
    ),
    .init(
        title: "Window Functions",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Window Functions", description: "Learn how window functions can be used for complex calculations."),
            CardContent(title: "Practical Examples of Window Functions", description: "See examples of window functions in action."),
        ]
    )
]

var pythonCourses: [Course] = [
    .init(
        title: "Intro to Python",
        imageName: "Book 1",
        author: "Rachael Lippincott",
        rating: 4,
        bookViews: 1023,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Python Basics", description: "Learn the basics of Python programming."),
            CardContent(title: "Control Structures in Python", description: "Understand if-statements, for-loops, and while-loops in Python."),
        ]
    ),
    .init(
        title: "Understanding pandas",
        imageName: "Book 2",
        author: "William B.Irvine",
        rating: 5,
        bookViews: 2049,
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to pandas", description: "Get started with the powerful data manipulation library."),
            CardContent(title: "Dataframes and Series in pandas", description: "Understand the two main data structures in pandas."),
        ]
    )
]
