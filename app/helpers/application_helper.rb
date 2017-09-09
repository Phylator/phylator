module ApplicationHelper

    def simple_remove_fields name, f
        f.input(:_destroy, as: :hidden) + link_to(name, 'javascript:void(0);', class: 'removeMeasurement')
    end

    def simple_add_fields name, f, association, partial, function
        new_object = f.object.class.reflect_on_association(association).klass.new
        fields = f.simple_fields_for(association, new_object, child_index: "new_#{association}") do |builder|
            render partial, f: builder, destroy: true
        end
        link_to(name, 'javascript:void(0);', onClick: "#{function}($(this), \"#{association}\", \"#{escape_javascript(fields)}\")")
    end

end
