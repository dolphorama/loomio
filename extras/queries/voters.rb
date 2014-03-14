class Queries::Voters
  class << self
    def group_members_that_havent_voted_on(motion)
      user_ids_that_voted = User.find motion.votes.pluck(:user_id)
      if user_ids_that_voted.empty?
        motion.group.users
      else
        motion.group.users.where('users.id not in (?)', user_ids_that_voted)
      end
    end
  end
end
