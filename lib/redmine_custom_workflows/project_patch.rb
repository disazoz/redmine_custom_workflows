module RedmineCustomWorkflows
  module ProjectPatch
    unloadable

    def self.included(base)
      base.class_eval do
        has_and_belongs_to_many :custom_workflows
        #accepts_nested_attributes_for :custom_workflow, :update_only => true
        safe_attributes :custom_workflow_ids, :if =>
            lambda { |project, user| project.new_record? || user.allowed_to?(:manage_project_workflow, project) }
      end
    end
  end
end
