using System.Collections.Generic;
using FluentValidation;
using Weapsy.Core.Domain;
using Weapsy.Domain.Model.Templates.Commands;

namespace Weapsy.Domain.Model.Templates.Handlers
{
    public class CreateTemplateHandler : ICommandHandler<CreateTemplate>
    {
        private readonly ITemplateRepository _templateRepository;
        private readonly IValidator<CreateTemplate> _validator;

        public CreateTemplateHandler(ITemplateRepository templateRepository,
            IValidator<CreateTemplate> validator)
        {
            _templateRepository = templateRepository;
            _validator = validator;
        }

        public ICollection<IEvent> Handle(CreateTemplate command)
        {
            var template = Template.CreateNew(command, _validator);

            _templateRepository.Create(template);

            return template.Events;
        }
    }
}
