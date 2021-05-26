# Specifications for the Rails Assessment
Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        Lecturer has_many Courses
        Course has_many Students through Enrollment and Student has_many Courses through Enrollment.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        Course belongs_to Lecturer.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        Course has_many Students through Enrollment and Student has_many Courses through Enrollment.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        Course has_many Students through Enrollment and Student has_many Courses through Enrollment.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        The Lecturer can change a student's grade which is tracked in the join table Enrollment.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        Lecturer must have unique email and  fullname, lastname. Student must have email, name, and degree. Course must have a subject.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        class method scope to organize Course by day and has its own route
- [x] Include signup (how e.g. Devise)
        Local and OmniAuth
- [x] Include login (how e.g. Devise)
        Local and OmniAuth
- [x] Include logout (how e.g. Devise)
        Local and OmniAuth
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
        Course nested in Lecturer. lecturers/:lecturer_id/courses
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        lecturers/:lecturer_id/courses/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        sign in/new errors ... flash notices.
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate