# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CalculationRecord.destroy_all

record1 = CalculationRecord.create(
    {
        input: ",1,2,3,#,#,4,5,#,#,#,#",
    }
)


record2 = CalculationRecord.create(
    {
        input: ",12,2,3,#,#,43,5,#,#,#,#",
    }
)
