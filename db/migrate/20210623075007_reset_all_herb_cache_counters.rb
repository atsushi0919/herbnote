class ResetAllHerbCacheCounters < ActiveRecord::Migration[6.1]
  def change
    def up
      Herb.find_each { |herb| Herb.reset_counters(herb.id, :favorite_count) }
    end

    def down
    end
  end
end
