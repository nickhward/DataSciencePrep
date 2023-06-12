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
    var questions: [String]
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
        imageName: "statsfound",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This course offers a comprehensive introduction to statistics and data analysis. You'll learn about the fundamental measures of central tendency and dispersion, understand various sampling techniques, and distinguish between different types of data. The course will also elaborate on the concept of population and sample, and potential errors and biases in sampling. You'll be introduced to experimental design, covering studies like randomized controlled trials, observational studies, and more. Additionally, you'll explore various data collection methods including surveys, experiments, observations, and interviews, equipping you with practical tools for statistical research.",
        cardContent: [
            CardContent(title: "Measures of Central Tendency", description: """
                • **Mean:** The average value of a data set, obtained by adding all numbers in the set and then dividing by the count of numbers.
                
                • **Median:** The middle value in a data set. For an odd number of observations, it is the middle number; for an even number of observations, it is the average of the two middle numbers.
                
                • **Mode:** The most frequently occurring value in a data set. A data set may have one mode (unimodal), more than one mode (multimodal), or no mode at all.
                """),
            CardContent(title: "Measures of Dispersion", description: """
                • **Range:** The difference between the highest and lowest values in a data set.
                
                • **Variance:** The average of the squared differences from the mean. It measures how far each number in the set is from the mean and thus from every other number in the set.
                
                • **Standard Deviation:** The square root of variance, providing a measure of dispersion in the same units as the original data.
                
                • **Interquartile Range (IQR):** The range between the first quartile (25th percentile) and the third quartile (75th percentile). It measures statistical dispersion, or how far apart the data points are spread.
                """),
            CardContent(title: "Sampling Techniques", description: """
                • **Random Sampling:** Each member of the population has an equal chance of being selected.
                
                • **Stratified Sampling:** The population is divided into subgroups (strata) based on specific characteristics, and samples are randomly selected from each stratum.
                
                • **Cluster Sampling:** The population is divided into groups (clusters), usually geographically, and a random sampling of clusters is selected.
                
                • **Systematic Sampling:** Every nth member of the population is selected.
                """),
            CardContent(title: "Types of Data", description: """
                • **Categorical/Nominal:** Data that can be sorted into categories but having no order or priority. E.g., Colors, Names.
                
                • **Ordinal:** Categorical data that has an explicit order. E.g., Ratings scale from 1 to 5.
                
                • **Interval:** Numerical data without a true zero point. E.g., Temperature in Celsius or Fahrenheit.
                
                • **Ratio:** Numerical data with a true zero point. E.g., Age, Height.
                """),
            CardContent(title: "Population vs Sample", description: """
                • **Population:** The entire group that you want to draw conclusions about.
                
                • **Sample:** A subset of the population that is used in your study. It is a slice of the population and needs to be representative for your conclusions to be valid for the population.
                """),
            CardContent(title: "Sampling Error and Bias", description: """
                • **Sampling Error**: The error caused by observing a sample instead of the whole population. The sampling error results in statistical bias, and the larger the sample, the less pronounced the sampling error.

                • **Selection Bias:** Selection bias occurs when sample selection is not random and therefore not representative of the target population.
                        
                • **Confirmation Bias:** The tendency to search for, interpret, favor, and recall information that confirms or supports one's prior personal beliefs or values.
                """),
            CardContent(title: "Experimental Design", description: """
                • **Randomized Controlled Trials:** A type of scientific experiment most commonly used in testing the safety and efficacy of healthcare services like new medications.

                • **Observational Studies:** Where the researchers do not interfere with what the subjects are doing and merely observe the outcome.
                        
                • **Cohort Studies:** Involves following a group of people (a cohort) over time.
                        
                • **Cross-Sectional Studies:** Observations of a population or a representative subset at one specific point in time.
                """),
            CardContent(title: "Data Collection Methods", description: """
                • Surveys: Collection of data from a pre-defined group to gain information and insights on various topics of interest.

                • **Experiments:** Conducted in controlled conditions where variables can be manipulated to collect data.
                        
                • **Observations:** Qualitative method of data collection where researchers observe & record events without interfering with the process.
                        
                • **Interviews:** A method of qualitative data collection where one person (the interviewer) asks questions to another (the interviewee).
                """),
            
            
        ]
    ),
    .init(
        title: "Normal Distribution",
        imageName: "statisticsfoundations",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["Can you explain the Central Limit Theorem?", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This segment of the course focuses on normal distribution and its significance in statistical analysis. You'll explore the properties of normal distribution, including its symmetry and the central role of mean, mode, and median. The concept of standard normal distribution will be covered, with emphasis on the transformation process. The Central Limit Theorem (CLT) takes center stage, with detailed discussions on why it's pivotal for normal approximation, simplifying analysis, providing predictability, enabling hypothesis testing, understanding sample means, and its universal applicability. You'll also learn about the Z-score and the empirical rule, both of which are crucial tools when dealing with normally distributed data.",
        cardContent: [
            CardContent(title: "Properties of Normal Distribution", description: """
                • Symmetrical: The left half is a mirror image of the right half.
                
                • Mean, Mode and Median are all equal.
                
                • Approximately 68% of the data falls within one standard deviation of the mean, 95% falls within two standard deviations, and 99.7% falls within three standard deviations.
                
                • Defined by two parameters: mean (µ) and standard deviation (σ).
                """),
            CardContent(title: "Standard Normal Distribution", description: """
                A normal distribution with a mean of 0 and a standard deviation of 1. Any normal distribution can be converted into a standard normal distribution, and vice versa, using this formula: Z = (X - µ) / σ, where Z is the standard score, X is the value, µ is the mean and σ is the standard deviation.
                """),
            CardContent(title: "Central Limit Theorem (CLT)", description: """
                If you have a population with mean µ and standard deviation σ and take sufficiently large random samples from the population with replacement, then the distribution of the sample means will be approximately normally distributed. This will hold true regardless of whether the source population is normal or skewed, provided the sample size is sufficiently large (usually n > 30).
                """),
            CardContent(title: "1. Why CLT is important", description: """
                **Normal Approximation:** The theorem states that if you draw a large number of independent, identically distributed random variables, their summed or averaged values tend towards a normal distribution, regardless of the shape of their original distribution. This is why the normal distribution appears so commonly in the natural and social sciences.
                """),
            CardContent(title: "2. Why CLT is important", description: """
                **Simplifies Analysis:** Many statistical techniques assume that data are normally distributed. The CLT allows these techniques to be applied to problems involving means or sums even when the original variables themselves are not normally distributed.
                """),
            CardContent(title: "3. Why CLT is important", description: """
                **Predictability and Control:** In many practical applications, the CLT allows us to make predictions about large populations based on the characteristics of samples. For instance, manufacturers can ensure the quality of a product through sampling rather than examining every item.
                """),
            CardContent(title: "4. Why CLT is important", description: """
                **Foundation for Hypothesis Testing:** The CLT is the foundation for many statistical procedures, including hypothesis tests like t-tests and ANOVAs and the creation of confidence intervals. It allows us to quantify the level of uncertainty or variability when making inferences about a population based on a sample.
                """),
            CardContent(title: "5. Why CLT is important", description: """
                **Understanding of Sample Means:** It tells us that the distribution of sample means will be normally distributed around the population mean. This underpins the logic of predicting population parameters based on sample statistics.
                """),
            CardContent(title: "6. Why CLT is important", description: """
                **Application Regardless of Population Distribution:** Regardless of the distribution of the population, as long as the sample size is large enough (usually n > 30 is considered sufficient), the distribution of the sample means will approach a normal distribution. This universality makes the CLT a powerful tool in statistics.
                """),
            CardContent(title: "Z-Score", description: """
                A statistic that tells us how many standard deviations an element is from the mean. They are a useful way to compare data points from different normal distributions.
                """),
            CardContent(title: "Empirical Rule", description: """
                Also known as the 68-95-99.7 rule, it's a shorthand used to remember the percentage of values that lie within a certain number of standard deviations from the mean in a normal distribution. Specifically, 68% of data falls within ±1σ, 95% within ±2σ, and 99.7% within ±3σ.
                """),
        ]
    ),
    .init(
        title: "Confidence",
        imageName: "confidence",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This section of the course discusses the crucial concepts of Confidence Intervals, essential assumptions, and their construction and interpretation in statistical analysis. The materials cover the premises for Confidence Intervals, where observations need to be independent and identically distributed (i.i.d.). There's also an in-depth exploration of the concept of Confidence Interval, its interpretation, and Confidence Level, along with a look at the Margin of Error.",
        cardContent: [
            CardContent(title: "Assumptions for Confidence Intervals", description: """
              • Assumptions: Generally, we assume that observations are independent and identically distributed (i.i.d.). Also, when constructing a confidence interval for a mean, we assume that the population is normally distributed or that we have a large enough sample size (n > 30) such that the Central Limit Theorem applies.
            """),
            CardContent(title: "Confidence Interval", description: """
            • **Confidence Interval:** A range of values, derived from a data set, that is likely to contain the value of an unknown population parameter. It provides an estimated range of values which is likely to include an unknown population parameter, the estimated range being calculated from a given set of sample data.
            
            • **Interpretation:** If a 95% confidence interval is [a, b], we can say that we are 95% confident that the true population parameter is between a and b.
            """),
            CardContent(title: "Confidence Level", description: """
            • **Confidence Level:** Indicates the probability that the range of values defined by the confidence interval contains the true population parameter. It quantifies the level of confidence that the parameter lies within the confidence interval. Common choices for the confidence level C are 0.90, 0.95, and 0.99.
            """),
            CardContent(title: "Margin of Error", description: """
            • **Margin of Error:** It expresses the maximum expected difference between the true population parameter and a sample estimate of that parameter. The margin of error depends on the standard deviation of the population, the size of the sample, and the desired confidence level.
            """),
            CardContent(title: "Constructing Confidence Intervals", description: """
            • **For Population Mean (σ Known):** When we know the standard deviation of the population, the formula to calculate a confidence interval for a population mean is:
                        
                    CI = x̄ ± Z * (σ/√n)
                        
            where x̄ is the sample mean, Z is the Z-score (from the standard normal distribution) corresponding to the desired confidence level, σ is the population standard deviation, and n is the sample size.
                        
            • **For Population Mean (σ Unknown):** When we don't know the standard deviation of the population, we use the sample standard deviation (s) as an estimate. The formula to calculate a confidence interval for a population mean becomes:
                        
                    CI = x̄ ± t * (s/√n)
                        
            where t is the t-score (from the t-distribution) corresponding to the desired confidence level. This is often the case in practical situations, as population standard deviation is rarely known.
            """),
            CardContent(title: "Hypothesis Testing and Confidence Intervals", description: """
            • **Hypothesis Testing:** Confidence intervals are directly related to hypothesis testing. A confidence interval that does not contain the hypothesized parameter value is equivalent to a hypothesis test that results in a rejection of the null hypothesis at the corresponding significance level.
            """),
            CardContent(title: "Confidence Intervals for Proportions", description: """
            • For Proportions: Confidence intervals can also be constructed for proportions. The formula is:
                                    
                CI = p̂ ± Z * √( (p̂ * (1 - p̂) ) / n)
                        
                where p̂ is the sample proportion, Z is the Z-score corresponding to the desired confidence level, and n is the sample size.
            """),
            
        ]
    ),
    .init(
        title: "Hypothesis Testing",
        imageName: "typeerror",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "In this course, you will gain a fundamental understanding of hypothesis testing, a key method for making data-driven decisions. The course will guide you through the process of formulating null and alternative hypotheses, understanding types of errors, interpreting p-values, and choosing the right statistical tests such as Z-tests, T-tests, Chi-Square tests, F-tests, and ANOVA. Special emphasis will be given to understanding the assumptions required for each test and handling different types of data. By the end of the course, you will be able to competently perform hypothesis tests and interpret their results in practical scenarios.",
        cardContent: [
            CardContent(title: "What is Hypothesis Testing?:", description: """
            Hypothesis testing is a statistical method used to make inferences or draw conclusions about a population based on a sample of data. It's used to test the validity of a claim (or hypothesis) about a population parameter such as the mean or proportion.
            """),
            CardContent(title: "Null and Alternative Hypotheses", description: """
            Every hypothesis test involves two competing hypotheses:

            • **The Null Hypothesis (H0):** This is a statement of no effect, or status quo, which we try to disprove.
            
            • **The Alternative Hypothesis (H1 or Ha):** This is a statement that indicates the presence of an effect, or a change from the status quo, which we try to prove.
            """),
            CardContent(title: "Types of Errors", description: """
            When we perform hypothesis testing, we can make two types of errors:

            • **Type I error (α):** This is the probability of rejecting the null hypothesis when it is actually true (false positive).
            
            • **Type II error (β):** This is the probability of not rejecting the null hypothesis when it is false (false negative).
            
            The level of significance, often denoted by α, is the probability of committing a Type I error. Common choices for α are 0.05 and 0.01.
            """),
            CardContent(title: "P-value", description: """
            The p-value is the probability of observing the data given that the null hypothesis is true. A small p-value (typically ≤ 0.05) indicates strong evidence against the null hypothesis, so you reject the null hypothesis. A large p-value (> 0.05) indicates weak evidence against the null hypothesis, so you fail to reject the null hypothesis.
            """),
            CardContent(title: "Test Statistic", description: """
            The test statistic depends on the type of test being conducted (e.g., Z-test, T-test, Chi-square test) and the data itself. The test statistic is a summary of the data that is used in the significance test.
            """),
            CardContent(title: "Power of a Test", description: """
            The power of a test is the probability that it correctly rejects a false null hypothesis. It's equal to 1-β, and a higher power is desirable.
            """),
            CardContent(title: "Hypothesis Testing Steps:", description: """
            • Formulate the null and alternative hypotheses.
            
            • Choose the significance level (α).
            
            • Determine the appropriate statistical test.
            
            • Compute the test statistic.
            
            • Determine the critical or p-value (probability) associated with the observed statistic.
            
            • Make a decision to accept or reject the null hypothesis.
            """),
            CardContent(title: "Common Tests", description: """
            • **Z-test:** Used when data is normally distributed, population variance is known, and the sample size is large.
            
            • **T-test:** Used when data is normally distributed, population variance is unknown, and the sample size is small.
            
            • **Chi-Square Test:** Used when dealing with categorical variables.
            
            • **F-test:** Used to compare two variances or to test the overall significance in a multiple regression model.
            
            • **ANOVA:** Used to compare the means of more than two groups.
            """),
            CardContent(title: "Assumptions for Z-Test", description: """
            • The data follows a normal distribution.
            
            • The standard deviation of the population is known.
            
            • Observations are independent of each other.
            
            • The sample size is large (usually n > 30).
            """),
            CardContent(title: "Assumptions for T-Test", description: """
            • The data follows a normal distribution. If not, the Central Limit Theorem can justify the use of the test for large samples.
            
            • Observations are independent of each other.
            
            • The sample size is relatively small (usually n < 30).
            
            • For independent two-sample T-tests, it's also assumed that the two populations the samples come from have the same variance (homoscedasticity). If this assumption is not met, a Welch's t-test can be used instead.
            """),
            CardContent(title: "Chi-Square Test", description: """
            • For the Chi-square test of independence, the observations should be independent, and each participant contributes data to only one cell of the contingency table.
            
            • The data are categorical or can be bucketed into categories.
            
            • Expected frequencies for each cell of the contingency table should be at least 5 for a valid Chi-square test.
            """),
            CardContent(title: "Assumptions for F-Test", description: """
            • The data follows a normal distribution.
            
            • The samples are independent.
            
            • Variances of the populations are equal (homoscedasticity).
            """),

        ]
    ),
    .init(
        title: "Bayesian Statistics",
        imageName: "baye",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "Bayesian statistics is a subset of the field of statistics in which the evidence about the true state of the world is expressed in terms of degrees of belief. This contrasts with frequentist statistics, where evidence is a set of observations and does not come with a belief attached. Here's what you need to know about Bayesian statistics.",
        cardContent: [
            CardContent(title: "Bayesian Probability", description: """
            In Bayesian statistics, probability refers to a degree of belief or subjective probability. This degree of belief may be based on prior knowledge about the event, such as the results of previous experiments, or on personal beliefs about the event.
            """),
            CardContent(title: "Prior Probability (Prior)", description: """
            This is an initial degree of belief that is assigned before any relevant evidence is taken into account. The prior can be subjective (based on belief) or objective (based on established knowledge).
            """),
            CardContent(title: "Likelihood", description: """
            This is the probability of the data given the parameters. In other words, it’s how likely you are to have seen your observed data given the parameters of your model.
            """),
            CardContent(title: "Posterior Probability (Posterior)", description: """
            This is the revised or updated probability of an event occurring after taking into consideration new information. The posterior probability is calculated via Bayes' theorem.
            """),
            CardContent(title: "Bayes' Theorem", description: """
            The foundation of Bayesian statistics is Bayes' theorem, which is a fundamental theorem in probability theory and statistics that describes how to update the probabilities of hypotheses when given evidence. It's often formulated as:

                P(A|B) = [P(B|A) * P(A)] / P(B)
            
            where:

            • P(A|B) is the posterior probability of hypothesis A given the data B.
            • P(B|A) is the likelihood, the probability of the data B given that the hypothesis A was true.
            • P(A) is the prior, the initial degree of belief in A.
            • P(B) is the evidence, the total probability of the data as calculated by considering all possible hypotheses.
            """),
            CardContent(title: "Bayesian Inference", description: """
            Bayesian inference is the process of updating prior beliefs given observed data, using Bayes' theorem. The outcome is a 'posterior' belief which is the product of the 'likelihood' and the prior probability.
            """),
            CardContent(title: "Bayesian vs. Frequentist Statistics", description: """
            While frequentist statistics uses a sample of data to make generalizable claims about a population, Bayesian statistics allows you to incorporate prior knowledge and beliefs into your statistical analysis. Also, while frequentist statistics computes a single best estimate, Bayesian statistics often involves computing a distribution of estimates.
            """),
            CardContent(title: "Common Bayesian Methods:", description: """
            • **Bayesian Hypothesis Testing:** Unlike traditional hypothesis testing, Bayesian hypothesis testing provides a probability for a hypothesis rather than simply rejecting or not rejecting it.

            • **Bayesian Regression Models:** These models allow you to include prior knowledge about the parameters in the model, rather than starting with the assumption that all values are equally likely.

            • **Bayesian Networks:** These are graphical models that represent probabilistic relationships among variables.

            • **Markov Chain Monte Carlo (MCMC) Methods:** These are algorithms for sampling from a probability distribution based on constructing a Markov chain that has the desired distribution as its equilibrium distribution. It's often used when it’s too complicated to calculate the distribution directly.
            """),
            CardContent(title: "Advantages and Disadvantages", description: """
            • **Advantages:** Bayesian methods allow for the incorporation of prior knowledge into the statistical analysis. They can provide a full probability distribution of outcomes, rather than a single estimate. They are excellent for dealing with complex modeling problems, as they can model complex, hierarchical systems and account for uncertainty.

            • **Disadvantages:** Choosing a good prior can be difficult, especially for complex models. Bayesian methods can also be computationally intensive, especially for larger datasets.
            """),
            
        ]
    ),
]

var probabilityCourses: [Course] = [
    .init(
          title: "Bayes",
          imageName: "Book 1",
          author: "Nicholas Ward",
          rating: 4,
          bookViews: 1023,
          questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Bayes Theorem", description: "Understanding the foundation of conditional probability."),
              CardContent(title: "Applications of Bayes", description: "How Bayes theorem is applied in real-world problems."),
          ]
      ),
    .init(
          title: "Theorems",
          imageName: "Book 2",
          author: "Nicholas Ward",
          rating: 5,
          bookViews: 2049,
          questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Law of Large Numbers", description: "Understanding the theorem underpinning the stability of long-term outcomes."),
              CardContent(title: "Central Limit Theorem", description: "The importance of this theorem in statistical analysis."),
          ]
      ),
    .init(
          title: "Bayes",
          imageName: "Book 1",
          author: "Nicholas Ward",
          rating: 4,
          bookViews: 1023,
          questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
          courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
          cardContent: [
              CardContent(title: "Bayes Theorem", description: "Understanding the foundation of conditional probability."),
              CardContent(title: "Applications of Bayes", description: "How Bayes theorem is applied in real-world problems."),
          ]
      ),
    .init(
          title: "Theorems",
          imageName: "Book 2",
          author: "Nicholas Ward",
          rating: 5,
          bookViews: 2049,
          questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
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
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Linear Regression", description: "The basics of linear predictive modeling."),
            CardContent(title: "Assumptions of Linear Regression", description: "What needs to be true for linear regression to be the right choice?"),
        ]
    ),
    .init(
        title: "Supervised ML",
        imageName: "Book 1",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Linear Regression", description: "The basics of linear predictive modeling."),
            CardContent(title: "Assumptions of Linear Regression", description: "What needs to be true for linear regression to be the right choice?"),
        ]
    ),
    .init(
        title: "Supervised ML",
        imageName: "Book 1",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to Supervised Learning", description: "The foundation of predictive modeling."),
            CardContent(title: "Regression vs Classification", description: "Understanding the two main types of supervised learning."),
        ]
    ),
    .init(
        title: "Linear Regression",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
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
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to PyTorch", description: "Getting started with this deep learning framework."),
            CardContent(title: "Building Neural Networks with PyTorch", description: "Understanding the process of model creation in PyTorch."),
        ]
    ),
    .init(
        title: "Tensorflow",
        imageName: "Book 1",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to tensorflow", description: "Getting started with this deep learning framework."),
            CardContent(title: "Building Neural Networks with tensorflow", description: "Understanding the process of model creation in tensorflow."),
        ]
    ),
    .init(
        title: "PyTorch",
        imageName: "Book 1",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
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
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to SQL", description: "Learn about SQL and its purposes."),
            CardContent(title: "SQL Queries", description: "Understand the basics of retrieving data using SQL queries."),
        ]
    ),
    .init(
        title: "Window Functions",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Understanding Window Functions", description: "Learn how window functions can be used for complex calculations."),
            CardContent(title: "Practical Examples of Window Functions", description: "See examples of window functions in action."),
        ]
    ),
    .init(
        title: "Examples",
        imageName: "Book 1",
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to SQL", description: "Learn about SQL and its purposes."),
            CardContent(title: "SQL Queries", description: "Understand the basics of retrieving data using SQL queries."),
        ]
    ),
    .init(
        title: "Window Functions",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
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
        author: "Nicholas Ward",
        rating: 4,
        bookViews: 1023,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Python Basics", description: "Learn the basics of Python programming."),
            CardContent(title: "Control Structures in Python", description: "Understand if-statements, for-loops, and while-loops in Python."),
        ]
    ),
    .init(
        title: "Understanding pandas",
        imageName: "Book 2",
        author: "Nicholas Ward",
        rating: 5,
        bookViews: 2049,
        questions: ["what is the mean", "what is the mode?", "what is the difference between population and sample?"],
        courseDescription : "This will include the basics of statistics, why it is necessary, and its role in data interpretation and decision making.",
        cardContent: [
            CardContent(title: "Introduction to pandas", description: "Get started with the powerful data manipulation library."),
            CardContent(title: "Dataframes and Series in pandas", description: "Understand the two main data structures in pandas."),
        ]
    )
]
