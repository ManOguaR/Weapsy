using System;
using System.Collections.Generic;
using Weapsy.Core.Domain;
using Weapsy.Domain.Model.Sites.Commands;

namespace Weapsy.Domain.Model.Sites.Handlers
{
    public class CloseSiteHandler : ICommandHandler<CloseSite>
    {
        private readonly ISiteRepository _siteRepository;

        public CloseSiteHandler(ISiteRepository siteRepository)
        {
            _siteRepository = siteRepository;
        }

        public ICollection<IEvent> Handle(CloseSite command)
        {
            var site = _siteRepository.GetById(command.Id);

            if (site == null)
                throw new Exception("Site not found.");

            site.Close();

            _siteRepository.Update(site);

            return site.Events;
        }
    }
}
