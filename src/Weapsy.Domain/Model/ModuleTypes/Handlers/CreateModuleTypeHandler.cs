using System.Collections.Generic;
using FluentValidation;
using Weapsy.Core.Domain;
using Weapsy.Domain.Model.ModuleTypes.Commands;

namespace Weapsy.Domain.Model.ModuleTypes.Handlers
{
    public class CreateModuleTypeHandler : ICommandHandler<CreateModuleType>
    {
        private readonly IModuleTypeRepository _moduleTypeRepository;
        private readonly IValidator<CreateModuleType> _validator;

        public CreateModuleTypeHandler(IModuleTypeRepository moduleTypeRepository, IValidator<CreateModuleType> validator)
        {
            _moduleTypeRepository = moduleTypeRepository;
            _validator = validator;
        }

        public ICollection<IEvent> Handle(CreateModuleType command)
        {
            var moduleType = ModuleType.CreateNew(command, _validator);

            _moduleTypeRepository.Create(moduleType);

            return moduleType.Events;
        }
    }
}
