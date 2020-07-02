class Say < ApplicationRecord
  validates:content, length:{minimum:1}
  validates:content, length:{maximum:140}
end
