# @!parse
#   class ActiveRecord::Base
#     extend ActiveRecord::QueryMethods
#     extend ActiveRecord::FinderMethods
#     extend ActiveRecord::Associations::ClassMethods
#     include ActiveRecord::Persistence
#   end

# @!override ActiveRecord::FinderMethods#find
#   @overload find(id)
#     @param id [Integer]
#     @return [self]
#   @overload find(list)
#     @param list [Array]
#     @return [Array<self>]
#   @overload find(*args)
#     @return [Array<self>]
#   @return [self, Array<self>]
